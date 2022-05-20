import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rutasapp/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:rutasapp/pages/acesso_gps_page.dart';
import 'package:rutasapp/pages/loading_page.dart';
import 'package:rutasapp/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MiUbicacionBloc())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoadingPage(),
        routes: {
          'mapa': (_) => const MapaPage(),
          'loading': (_) => const LoadingPage(),
          'acesso_gsp': (_) => const AcessoGpsPage()
        },
      ),
    );
  }
}
