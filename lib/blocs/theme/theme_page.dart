import 'dart:math';

import 'package:bloc_demo/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocConsumer<ThemeBloc, ThemeState>(
        listener: (context, state){
          // BlocProvider.of<ThemeBloc>(context).state.appTheme;
          context.read<ThemeBloc>().state.appTheme;
        },
        builder: (context, state){
          return MaterialApp(
            title: 'Material App',
            theme: state.appTheme == AppTheme.light ? ThemeData.light() : ThemeData.dark(),
            home: Scaffold(
              appBar: AppBar(
                title: Text('Theme'),
              ),
              body: Center(
                child: ElevatedButton(onPressed: (){
                  final randInt = Random().nextInt(10);
                  // BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(randInt: randInt));
                  context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
                },
                child: Text("Change Theme"),),
              ),
            ),
          );
        },
      ),
    );
  }
}
