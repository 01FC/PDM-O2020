import 'dart:io';

import 'package:biometrico/confidential.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL and Image loading',
      home: Scaffold(
        appBar: AppBar(
          title: Text("URL and Image loading"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;
  TextEditingController _textController = TextEditingController();

  File _choosenImage;

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) {
            _homeBloc = HomeBloc();
            return _homeBloc;
          },
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is AuthenticationFailure) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Error de autenticacion"),
                    content: Text("${state.message}"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Aceptar"),
                      ),
                    ],
                  ),
                );
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is AuthenticationDone) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Confidential(),
                    ),
                  );
                  _homeBloc.add(DoneEvent());
                }
                if (state is LoadedImage) {
                  _choosenImage = state.image;
                  _homeBloc.add(DoneEvent());
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Ingresar URL"),
                    SizedBox(height: 12),
                    // search
                    TextField(
                      controller: _textController,
                    ),
                    SizedBox(height: 12),
                    MaterialButton(child: Text("Ir"), onPressed: () {}),
                    SizedBox(height: 24),
                    // Image
                    _choosenImage == null
                        ? Placeholder(
                            fallbackHeight: 150,
                            fallbackWidth: 150,
                          )
                        : Image.file(
                            _choosenImage,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(height: 12),
                    MaterialButton(
                      child: Text("Cargar imagen"),
                      onPressed: () {
                        _homeBloc.add(LoadImageEvent());
                      },
                    ),
                    SizedBox(height: 48),
                    MaterialButton(
                      child: Text(
                        "Confidencial",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        _homeBloc.add(AuthenticationEvent());
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
