import 'package:bloc_demo/blocs/counter/bloc_counter.dart';
import 'package:bloc_demo/blocs/theme/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter/bloc_counter_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Work with theme
    return ThemePage();
    // return MaterialApp(
    //   title: 'Material App',
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Counter Cubit'),
    //     ),
    //     // Work with Cubit
    //     // body: BlocProvider<CounterImpl>(
    //     //   create: (context) => CounterImpl(),
    //     //   child: CubitCounterPage(),
    //     // ),
    //     // Work with Bloc
    //     body: BlocProvider<BlocCounter>(
    //       create: (context) => BlocCounter(),
    //       child: const BlocCounterPage(),
    //     ),
    //   ),
    // );
  }
}
