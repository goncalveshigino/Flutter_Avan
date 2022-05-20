import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';


class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());

  final _geolocator = Geolocator();
  StreamSubscription<Position> _positionSubscription;

  void iniciarSeguimiento(){
      
       final locationOptions = LocationOptions(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10
      );

    _positionSubscription = _geolocator.getPositionStream(locationOptions).listen((position) { 
        print(position);
     });
  }

  void cancelarSeguimiento(){
    _positionSubscription?.cancel();
  }

     @override
     Stream<MiUbicacionState> mapEventToState( MiUbicacionEvent event) async* {

     }
}
