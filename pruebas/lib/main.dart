import 'package:flutter/material.dart';
import 'package:pruebas/images_page.dart';
import 'package:pruebas/search_page.dart';
import 'package:pruebas/text_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Text("Busqueda"),
            ),
            MaterialButton(
              onPressed: () {
                _launchPhone();
              },
              child: Text("Llamada"),
            ),
            MaterialButton(
              onPressed: () {
                _launchWhatsapp();
              },
              child: Text("Whatsapp"),
            ),
            MaterialButton(
              onPressed: () {
                _launchUrl();
              },
              child: Text("Abrir Link"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImagesPage(),
                  ),
                );
              },
              child: Text("Img base 64"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TextPage(),
                  ),
                );
              },
              child: Text("Texto"),
            ),
          ],
        ),
      ),
    );
  }

  _launchWhatsapp() async {
    await launch("whatsapp://send?phone=3317865113");
  }

  _launchPhone() async {
    await launch("tel:3317865113");
  }

  _launchUrl() async {
    await launch("https://iteso.mx");
  }
}
