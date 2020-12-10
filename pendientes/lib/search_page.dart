import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _listOfWords;
  List<String> _filteredListOfWords;
  var _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredListOfWords = List();
    _listOfWords = [
      "Hola",
      "Mundo",
      "Mexico",
      "Murcielago",
      "Honduras",
      "Anita",
      "Lava",
      "La",
      "Tina",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busqueda"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _searchTextController,
              decoration: InputDecoration(
                labelText: "Buscar palabra",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onChanged: (value) {
                _filterByWord();
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _filteredListOfWords.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) =>
                    Text("${_filteredListOfWords[index]}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _filterByWord() {
    setState(() {
      if (_searchTextController.text == "") {
        _filteredListOfWords = List();
        return;
      }
      _filteredListOfWords = _listOfWords.where((palabra) {
        return palabra.toLowerCase().contains(_searchTextController.text);
      }).toList();
    });
  }
}
