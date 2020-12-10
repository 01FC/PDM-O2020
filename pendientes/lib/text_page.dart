import 'package:flutter/material.dart';

import 'constants.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  bool expandedText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("long Text"),
      ),
      body: Row(
        children: [
          Container(
            width: 300,
            child: expandedText
                ? Text(
                    encodedImage,
                    maxLines: 8,
                  )
                : Text(
                    encodedImage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          IconButton(
            icon: expandedText
                ? Icon(Icons.arrow_circle_up)
                : Icon(Icons.arrow_circle_down),
            onPressed: () {
              setState(() {
                expandedText = !expandedText;
              });
            },
          ),
        ],
      ),
    );
  }
}
