import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetDataEvent) {
      var client = http.Client();

      // RSS feed
      var feed = await client
          .get(
              "https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=soccer")
          .then((response) {
        return response.body;
      }).then((bodyString) {
        var channel = RssFeed.parse(bodyString);
        print(channel);
        return channel;
      });
      yield DataRssState(feed);
    }
  }
}
