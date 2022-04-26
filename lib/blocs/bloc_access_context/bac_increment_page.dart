import 'package:bloc_demo/blocs/bloc_access_context/bac_increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BacIncrementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BacIncrementBloc>(
      create: (context) => BacIncrementBloc(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Bloc Access Context'),
          ),
          body: Builder(
            builder: (context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${context
                          .watch<BacIncrementBloc>()
                          .state
                          .increment}",
                      style: TextStyle(fontSize: 52.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<BacIncrementBloc>().add(ChangeBacIncrementEvent());
                      },
                      child: Text("Increment"),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
