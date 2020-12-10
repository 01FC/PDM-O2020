import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  NumberPage({Key key}) : super(key: key);

  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  double _sliderVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Numero a mostrar: $_sliderVal"),
            SizedBox(height: 24),
            Slider(
              value: _sliderVal,
              min: 0,
              max: 10,
              divisions: 5,
              label: "${_sliderVal.round()}",
              onChanged: (newSliderVal) {
                _sliderVal = newSliderVal;
                setState(() {});
              },
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(_sliderVal);
              },
              child: Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}
