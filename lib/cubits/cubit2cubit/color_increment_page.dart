import 'package:bloc_demo/cubits/cubit2cubit/color/color_cubit.dart';
import 'package:bloc_demo/cubits/cubit2cubit/increment/increment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorIncrementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<IncrementCubit>(
            create: (context) =>
                IncrementCubit(colorCubit: context.read<ColorCubit>()))
      ],
      child: MaterialApp(
        title: 'Material App',
        home: BlocConsumer<ColorCubit, ColorState>(
          listener: (context, state) {
            state.color;
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: context.watch<ColorCubit>().state.color,
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
                        context.read<ColorCubit>().changeColor();
                      },
                      child: Text("Change Color"),
                    ),
                    Text(
                      '${context.watch<IncrementCubit>().state.increment}',
                      style: TextStyle(fontSize: 52.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<IncrementCubit>().changeCounter();
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
    // return BlocProvider<ColorCubit>(
    //   create: (context) => ColorCubit(),
    //   child: BlocProvider<IncrementCubit>(
    //     create: (context) => IncrementCubit(
    //       colorCubit: context.read<ColorCubit>(),
    //     ),
    //     child: MaterialApp(
    //       title: 'Material App',
    //       home: BlocConsumer<ColorCubit, ColorState>(
    //         listener: (context, state) {
    //           state.color;
    //         },
    //         builder: (context, state) {
    //           return Scaffold(
    //             backgroundColor: state.color,
    //             appBar: AppBar(
    //               title: Text('Color Increment'),
    //             ),
    //             body: Center(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       context.read<ColorCubit>().changeColor();
    //                     },
    //                     child: Text("Change Color"),
    //                   ),
    //                   Text(
    //                     '${context.read<IncrementCubit>().state.increment}',
    //                     style: TextStyle(fontSize: 52.0),
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {
    //                       context.read<IncrementCubit>().changeCounter();
    //                     },
    //                     child: Text("Change Increment"),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
