import 'package:flutter/material.dart';
import 'package:themes_fonts/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blue,
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.red,
            fontSize: 42,
            fontWeight: FontWeight.w900,
          ),
          headline6: TextStyle(color: Colors.purple),
          button: TextStyle(
            fontSize: 28,
          ),
        ),
        fontFamily: "Kufam",
        backgroundColor: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
