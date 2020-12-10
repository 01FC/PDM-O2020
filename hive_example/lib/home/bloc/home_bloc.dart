import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // referencia a la box
  Box _configBox = Hive.box("configuraciones");

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadConfigsEvent) {
      try {
        // verificar si existen datos
        if (_configBox.values.isEmpty) throw Exception();
        //cargar datos
        Map<String, dynamic> _configs = {
          "drop": _configBox.get("drop"),
          "switch": _configBox.get("switch"),
          "checkbox": _configBox.get("checkbox"),
          "slider": _configBox.get("slider"),
        };
        yield LoadedDataState(configs: _configs);
      } catch (e) {
        print(e.toString());
        yield ErrorState(errorMessage: "No hay datos guardados");
      }
    } else if (event is SaveConfigsEvent) {
      try {
        //guardar datos
        _configBox.put("drop", event.configs["drop"]);
        _configBox.put("switch", event.configs["switch"]);
        _configBox.put("checkbox", event.configs["checkbox"]);
        _configBox.put("slider", event.configs["slider"]);
        yield ErrorState(errorMessage: "Guardado..."); // no es error
        yield HomeInitial();
      } catch (e) {
        print(e.toString());
        yield ErrorState(errorMessage: "ERROR: No se pudo guardar");
      }
    }
  }
}
