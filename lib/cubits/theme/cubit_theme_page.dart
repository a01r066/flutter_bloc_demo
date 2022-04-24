import 'dart:math';
import 'package:bloc_demo/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, CubitThemeState>(
        listener: (context, state) {
          state.appTheme;
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Material App',
            theme: state.appTheme == CubitAppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: Scaffold(
              appBar: AppBar(
                title: Text('Cubit theme'),
              ),
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    final randInt = Random().nextInt(10);
                    context.read<ThemeCubit>().changeCubitTheme(randInt);
                  },
                  child: Text("Change Theme"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
