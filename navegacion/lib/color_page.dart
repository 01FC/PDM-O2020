import 'package:flutter/material.dart';

class ColorPage extends StatelessWidget {
  final String datoEjemplo;
  ColorPage({Key key, @required this.datoEjemplo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          Text("Ejemplo de dato recibido: $datoEjemplo"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop("Rojo");
                },
                child: CircleAvatar(backgroundColor: Colors.red, radius: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop("Negro");
                },
                child:
                    CircleAvatar(backgroundColor: Colors.black38, radius: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop("Azul oscuro");
                },
                child: CircleAvatar(backgroundColor: Colors.indigo, radius: 15),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop("Verde");
                },
                child: CircleAvatar(backgroundColor: Colors.green, radius: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
