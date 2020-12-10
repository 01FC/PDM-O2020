import 'dart:convert';

import 'package:flutter/material.dart';

import 'constants.dart';

class ImagesPage extends StatelessWidget {
  ImagesPage({Key key}) : super(key: key);
  String image64 = encodedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decoding base 64"),
      ),
      body: Container(
        height: 300,
        width: 300,
        child: Image.memory(base64Decode(image64)),
      ),
    );
  }
}
