import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _userDataLink = "https://jsonplaceholder.typicode.com/users/";
  StreamSubscription<ConnectivityResult> _suscription;

  @override
  void initState() {
    super.initState();

    _suscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      print("Connectivity: $connectivityResult");
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          _isThereConnectivity(true);
          break;
        case ConnectivityResult.none:
          _isThereConnectivity(false);

          break;
        default:
      }
    });
  }

  @override
  void dispose() {
    _suscription.cancel();
    super.dispose();
  }

  // HTTP GET method
  Future _getUSerData() async {
    http.Response response = await http.get(_userDataLink);
    if (response.statusCode == HttpStatus.ok) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  void _isThereConnectivity(bool param0) {
    if (param0) {
      setState(() {});
      print("UI refreshed...");
    } else {
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text("There is no network connectivity..."),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Main page'),
        ),
        body: FutureBuilder(
          future: _getUSerData(),
          builder: (context, result) {
            if (result.hasData) {
              return ListView.builder(
                itemCount: (result.data as List).length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text("${result.data[index]["name"]}"),
                      subtitle: Text("${result.data[index]["phone"]}"),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Column(
                  children: [
                    Text("Trying to get data"),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
