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
            create: (context) =>
                IncrementBloc(colorBloc: context.read<ColorBloc>()))
      ],
      child: MaterialApp(
        title: 'Material App',
        home: BlocConsumer<ColorBloc, BlocColorState>(
          listener: (context, state) {
            state.color;
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: context.watch<ColorBloc>().state.color,
              appBar: AppBar(
                title: Text('Color Increment'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ChangeColorEvent());
                      },
                      child: Text("Change Color"),
                    ),
                    Text(
                      '${context.watch<IncrementBloc>().state.increment}',
                      style: TextStyle(fontSize: 52.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<IncrementBloc>().add(ChangeIncrementEvent());
                      },
                      child: Text("Change Increment"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
