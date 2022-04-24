import 'package:bloc_demo/blocs/counter/bloc_counter.dart';
import 'package:bloc_demo/blocs/counter/bloc_counter_event.dart';
import 'package:bloc_demo/blocs/counter/bloc_other_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_counter_state.dart';

class BlocCounterPage extends StatelessWidget {
  const BlocCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: BlocConsumer<BlocCounter, BlocCounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Counter: ${state.counter}"),
                );
              },
            );
          } else if (state.counter == -1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BlocOtherPage()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(
                '${context.watch<BlocCounter>().state.counter}',
                style: TextStyle(fontSize: 52.0),
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<BlocCounter>(context).add(IncrementCounterEvent());
                    },
                    child: Icon(Icons.add),
                    heroTag: "Increment",
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<BlocCounter>().add(DecrementCounterEvent());
                    },
                    child: Icon(Icons.remove),
                    heroTag: "Decrement",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
