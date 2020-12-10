import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _listOfWords;
  List<String> _filteredListOfWords;
  TextEditingController _searchTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _filteredListOfWords = List();
    _listOfWords = [
      "Hola",
      "Mundo",
      "Mexico",
      "Honduras",
      "Murcielago",
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
        title: Text("Search text field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchTextController,
              decoration: InputDecoration(
                labelText: "Buscar palabra",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              onChanged: (val) {
                _filterByWord();
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _filteredListOfWords.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return Text("${_filteredListOfWords[index]}");
                },
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
        return _filteredListOfWords;
      }
      _filteredListOfWords = _listOfWords.where((palabra) {
        return palabra.toLowerCase().contains(_searchTextController.text);
      }).toList();
    });
  }
}
