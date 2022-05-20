import 'package:flutter/material.dart';
import '../bloc/mi_ubicacion/mi_ubicacion_bloc.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({ Key key }) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> { 


  @override
  void initState() {
    
    // ignore: deprecated_member_use
   context.bloc<MiUbicacionBloc>().iniciarSeguimiento();

    super.initState();
  }

  @override
  void dispose() {
       // ignore: deprecated_member_use
     context.bloc<MiUbicacionBloc>().cancelarSeguimiento();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text('MapaPage'),
       ),
    );
  }
}