import 'package:flutter/material.dart';
import 'package:navegacion/color_page.dart';
import 'package:navegacion/number_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _slectedNum;
  String _slectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Color: ${_slectedColor ?? "-"}"),
            Text("Numero: ${_slectedNum ?? -1}"),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () async {
                _slectedColor = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ColorPage(
                      datoEjemplo: "Hola",
                    ),
                  ),
                );
                setState(() {});
              },
              color: Colors.yellow[50],
              child: Text("Elegir color"),
            ),
            SizedBox(height: 24),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => NumberPage(),
                  ),
                )
                    .then(
                  (returnedValue) {
                    _slectedNum = returnedValue;
                    setState(() {});
                  },
                );
              },
              color: Colors.purple[50],
              child: Text("Elegir numero"),
            ),
          ],
        ),
      ),
    );
  }
}
