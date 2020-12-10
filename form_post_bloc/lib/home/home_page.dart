import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc()..add(GetAllUsersEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ErrorState) {
              // dialogo o snackbar
              print("Error!!!");
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Error: ${state.error}"),
                  ),
                );
            }
          },
          builder: (context, state) {
            if (state is ShowUsersState) {
              return RefreshIndicator(
                // hacerlo sin refresh primero
                child: ListView.builder(
                  itemCount: state.usersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.usersList[index].name),
                    );
                  },
                ),
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context).add(GetAllUsersEvent());
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
