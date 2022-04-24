import 'package:bloc_demo/cubits/counter/cubit_counter_state.dart';
import 'package:bloc_demo/cubits/counter/cubit_other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_counter.dart';

class CubitCounterPage extends StatelessWidget {
  const CubitCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: BlocConsumer<CubitCounter, CubitCounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Counter is: ${state.counter}"),
                  );
                },
              );
            } else if (state.counter == -1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CubitOtherPage()));
            }
          },
          builder: (context, state) {
            return Center(
              child: Text(
                '${state.counter}',
                style: const TextStyle(fontSize: 52.0),
              ),
            );
          },
        ),
        // BlocListener<CounterImpl, CounterState>(
        //   listener: (context, state){
        //     if (state.counter == 3) {
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           return AlertDialog(
        //             content: Text("Counter is: ${state.counter}"),
        //           );
        //         },
        //       );
        //     } else if (state.counter == -1) {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => const OtherPage()));
        //     }
        //   },
        //   child: BlocBuilder<CounterImpl, CounterState>(
        //     builder: (context, state) {
        //       return Center(
        //         child: Text(
        //           '${state.counter}',
        //           style: const TextStyle(fontSize: 50.0),
        //         ),
        //       );
        //     },
        //     // child: Text(
        //     //   '${BlocProvider.of<CounterImpl>(context, listen: true).state.counter}',
        //     //   style: const TextStyle(fontSize: 50.0),
        //     // ),
        //   ),
        // ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterImpl>(context).increment();
                  context.read<CubitCounter>().increment();
                },
                child: const Icon(Icons.add),
                heroTag: "Increment",
              ),
              const SizedBox(
                width: 16.0,
              ),
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterImpl>(context).decrement();
                  context.read<CubitCounter>().decrement();
                },
                child: const Icon(Icons.remove),
                heroTag: "decrement",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
