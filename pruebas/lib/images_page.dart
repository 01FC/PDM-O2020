import 'dart:convert';

import 'package:flutter/material.dart';

import 'constants.dart';

class ImagesPage extends StatefulWidget {
  ImagesPage({Key key}) : super(key: key);

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  String image64 = encodedImageString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("decoding base 64"),
      ),
      body: Container(
        height: 300,
        width: 300,
        child: Image.memory(base64Decode(image64)),
      ),
    );
  }
}
