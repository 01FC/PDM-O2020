part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class DataRssState extends HomeState {
  final dynamic data;

  DataRssState(this.data);
  @override
  List<Object> get props => [data];
}
