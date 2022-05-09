import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


import 'package:rutasapp/helpers/helpers.dart';
import 'package:rutasapp/pages/acesso_gps_page.dart';
import 'package:rutasapp/pages/mapa_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({ Key key }) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver{


  @override
  void initState() {
     
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }


  @override
  void dispose() {
    
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    
    

     if( state == AppLifecycleState.resumed ){

       if( await Geolocator().isLocationServiceEnabled() ){
        Navigator.pushReplacement(context, navegarMapaFadeIn(context, const MapaPage() ) );
       }
       
     }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: FutureBuilder(
         future: checkGpsLocation(context),
         builder: (BuildContext context, AsyncSnapshot snapshot){
          
           if( snapshot.hasData ){
             return Center( child: Text(snapshot.data) );
           }else {
             return Center(child: CircularProgressIndicator(strokeWidth: 2),);
           }

         }
       )
    );
  }

   Future checkGpsLocation( BuildContext context ) async{

     //<PermisoGPS
     final permisoGPS = await Permission.location.isGranted;
      // GPSesta activo
     final gpsActivo = await Geolocator().isLocationServiceEnabled();

     if( permisoGPS && gpsActivo ){
       Navigator.pushReplacement(context, navegarMapaFadeIn(context, const MapaPage() ) );
       return '';
     } else if( !permisoGPS ){
       Navigator.pushReplacement(context, navegarMapaFadeIn(context, const AcessoGpsPage() ) );
       return 'Necessario permitir GPS';
     }else if( gpsActivo){
       return 'GPS activo';
     }


     
     // Navigator.pushReplacement(context, navegarMapaFadeIn(context,  const MapaPage() ) );
    //  Navigator.pushReplacement(context, navegarMapaFadeIn(context, const AcessoGpsPage() ) );

    
   }
}