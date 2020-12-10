import 'package:flutter/material.dart';
import 'package:nav/home_page.dart';
import 'package:nav/profile.dart';
import 'package:nav/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // esta sera la primer pantalla que se muestre
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/secondPage": (context) => SecondPage(),
        "/profile": (context) => Profile(),
      },
    );
  }
}
