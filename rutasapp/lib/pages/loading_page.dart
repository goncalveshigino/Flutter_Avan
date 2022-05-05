import 'package:flutter/material.dart';
import 'package:rutasapp/helpers/helpers.dart';
import 'package:rutasapp/pages/mapa_page.dart'; 

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: FutureBuilder(
         future: checkGpsLocation(context),
         builder: (BuildContext context, AsyncSnapshot snapshot){
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
         }
       )
    );
  }

   Future checkGpsLocation( BuildContext context ) async{


     await Future.delayed( const Duration( seconds: 3 ));
     Navigator.pushReplacement(context, navegarMapaFadeIn(context,  const MapaPage() ) );
   }
}