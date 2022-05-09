

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; 

class AcessoGpsPage extends StatefulWidget {

  const AcessoGpsPage({ Key key }) : super(key: key);

  @override
  State<AcessoGpsPage> createState() => _AcessoGpsPageState();
}

class _AcessoGpsPageState extends State<AcessoGpsPage> with WidgetsBindingObserver{


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

       if( await Permission.location.isGranted ){
         Navigator.pushReplacementNamed(context, 'loading');
       }
       
     }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

              const Text('É necessário GPS para usar esta app'),

              MaterialButton(
                child: const Text('Solicitar Acesso', style: TextStyle( color: Colors.white )),
                color: Colors.black,
                shape: const StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: () async {
                  
                    final status = await Permission.location.request();

                    acessoGPS( status );


                },
              )
           ],
         ),
       ),
    );
  }

  void acessoGPS( PermissionStatus status) {
     
   
     switch( status ){

       
       case PermissionStatus.granted:
         Navigator.pushReplacementNamed(context, 'mapa');
         break;
       case PermissionStatus.denied:
       case PermissionStatus.restricted:
       case PermissionStatus.permanentlyDenied:
         openAppSettings();
     }
  }
}