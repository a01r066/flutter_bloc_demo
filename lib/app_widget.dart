import 'package:bloc_demo/blocs/bloc_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc_counter_page.dart';
import 'cubits/counter/cubit_counter.dart';
import 'cubits/counter/cubit_counter_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter Cubit'),
        ),
        // Work with Cubit
        // body: BlocProvider<CounterImpl>(
        //   create: (context) => CounterImpl(),
        //   child: CubitCounterPage(),
        // ),
        // Work with Bloc
        body: BlocProvider<BlocCounter>(
          create: (context) => BlocCounter(),
          child: const BlocCounterPage(),
        ),
      ),
    );
  }
}
