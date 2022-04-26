import 'package:bloc_demo/blocs/event_transformer/evt_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EvtCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EvtCounterBloc>(
      create: (context) => EvtCounterBloc(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Event Transformer'),
          ),
          body: EvtCounterWidget(),
          floatingActionButton: Builder(
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(onPressed: () {
                      context.read<EvtCounterBloc>().add(IncrementEvtCounterEvent());
                    },
                      child: Icon(Icons.add),),
                    SizedBox(width: 16.0,),
                    FloatingActionButton(onPressed: () {
                      context.read<EvtCounterBloc>().add(DecrementEvtCounterEvent());
                    },
                      child: Icon(Icons.remove),),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

class EvtCounterWidget extends StatelessWidget {
  const EvtCounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EvtCounterBloc, EvtCounterState>(
      builder: (context, state) {
        return Center(
          child: Text("${state.increment}", style: TextStyle(fontSize: 52.0),),
        );
      },
    );
  }
}
