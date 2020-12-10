import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile page'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 256,
              width: 256,
              color: Colors.grey,
            ),
            Text("Usuario nombre"),
          ],
        ),
      ),
    );
  }
}
