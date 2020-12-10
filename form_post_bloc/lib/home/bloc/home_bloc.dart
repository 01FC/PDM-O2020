import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:form_post_bloc/models/user.dart';
import 'package:http/http.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<User> _usersList;
  final String _link = "https://jsonplaceholder.typicode.com/users";

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetAllUsersEvent) {
      yield HomeInitial();
      await _getAllUsers();

      if (_usersList.length > 0)
        yield ShowUsersState(usersList: _usersList);
      else
        yield ErrorState(error: "No hay elementos que mostrar");
    }
  }

  Future _getAllUsers() async {
    try {
      Response response = await get(_link);
      if (response.statusCode == 200) {
        _usersList = List();
        List<dynamic> data = jsonDecode(response.body);
        _usersList = ((data).map((element) => User.fromJson(element))).toList();
      }
    } catch (e) {
      // error parseando o al hacer request http
      _usersList = List();
    }
  }
}
