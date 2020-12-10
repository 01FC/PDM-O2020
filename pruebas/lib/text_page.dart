import 'package:flutter/material.dart';
import 'package:pruebas/constants.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text properties"),
      ),
      body: Container(
        child: Text(
          encodedImageString,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
