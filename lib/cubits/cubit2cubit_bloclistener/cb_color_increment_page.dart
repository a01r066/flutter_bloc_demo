import 'package:bloc_demo/cubits/cubit2cubit_bloclistener/color/cb_color_cubit.dart';
import 'package:bloc_demo/cubits/cubit2cubit_bloclistener/increment/cb_increment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CbColorIncrementPage extends StatelessWidget {
  const CbColorIncrementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CbColorCubit>(create: (context) => CbColorCubit()),
        BlocProvider<CbIncrementCubit>(create: (context) => CbIncrementCubit()),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: CbColorIncrementWidget(),
      ),
    );
  }
}

class CbColorIncrementWidget extends StatefulWidget {
  const CbColorIncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CbColorIncrementWidget> createState() => _CbColorIncrementWidgetState();
}

class _CbColorIncrementWidgetState extends State<CbColorIncrementWidget> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CbColorCubit, CbColorState>(
      listener: (context, colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          incrementSize = -100;
          context.read<CbIncrementCubit>().changeIncrement(-100);
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<CbColorCubit>().state.color,
        appBar: AppBar(
          title: Text('Color Increment Cubit BlocListener'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CbColorCubit>().changeColor();
                },
                child: Text("Change color"),
              ),
              Text(
                "${context.watch<CbIncrementCubit>().state.increment}",
                style: TextStyle(fontSize: 52.0),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CbIncrementCubit>().changeIncrement(incrementSize);
                },
                child: Text("Change increment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
