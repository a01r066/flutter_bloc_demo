import 'package:bloc_demo/blocs/bloc2bloc_BlocListener/color/bl_color_bloc.dart';
import 'package:bloc_demo/blocs/bloc2bloc_BlocListener/increment/bl_increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlColorIncrementPage extends StatelessWidget {
  const BlColorIncrementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlColorBloc>(create: (context) => BlColorBloc()),
          BlocProvider<BlIncrementBloc>(create: (context) => BlIncrementBloc()),
        ],
        child: MaterialApp(
        title: 'bloc2bloc listener',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlColorBloc, BlColorState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          incrementSize = -100;
          context.read<BlIncrementBloc>().add(ChangeBlIncrementEvent(incrementSize: incrementSize));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<BlColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  context.read<BlColorBloc>().add(ChangeBlColorEvent());
                },
              ),
              SizedBox(height: 20.0),
              Text(
                '${context.watch<BlIncrementBloc>().state.increment}',
                style: TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24.0),
                ),
                onPressed: () {
                  context.read<BlIncrementBloc>().add(ChangeBlIncrementEvent(incrementSize: incrementSize));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
