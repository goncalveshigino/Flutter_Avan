import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';


class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());

     @override
     Stream<MiUbicacionState> mapEventToState( MiUbicacionEvent event) async* {

     }
}
