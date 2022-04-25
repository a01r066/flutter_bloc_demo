import 'package:bloc_demo/blocs/bloc2bloc/color/color_bloc.dart';
import 'package:bloc_demo/blocs/bloc2bloc/increment/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocColorIncrementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<IncrementBloc>(
          create: (context) => IncrementBloc(
            colorBloc: context.read<ColorBloc>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'bloc2bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
    // return BlocProvider(
    //   create: (context) => ColorBloc(),
    //   child: MaterialApp(
    //     title: 'Material App',
    //     home: BlocConsumer<ColorBloc, BlocColorState>(
    //       listener: (context, state){
    //         state.color;
    //       },
    //       builder: (context, state){
    //         return Scaffold(
    //           appBar: AppBar(
    //             title: Text('Bloc Color Increment'),
    //           ),
    //           backgroundColor: state.color,
    //           body: Center(
    //             child: ElevatedButton(onPressed: (){
    //               // BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
    //               context.read<ColorBloc>().add(ChangeColorEvent());
    //             },
    //               child: Text("Change color"),),
    //           ),
    //         );
    //       }
    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorBloc>().state.color,
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
                context.read<ColorBloc>().add(ChangeColorEvent());
              },
            ),
            SizedBox(height: 20.0),
            Text(
              '${context.watch<IncrementBloc>().state.increment}',
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
                context.read<IncrementBloc>().add(ChangeIncrementEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
