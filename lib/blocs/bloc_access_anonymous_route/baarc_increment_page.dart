import 'package:bloc_demo/blocs/bloc_access_anonymous_route/baarc_counter_page.dart';
import 'package:bloc_demo/blocs/bloc_access_anonymous_route/baarc_increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaarcIncrementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BaarcIncrementBloc>(
      create: (context) => BaarcIncrementBloc(),
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text("Bloc Anonymous Access Routing"),
              ),
              body: const BaarcIncrementWidget())),
    );
  }
}

class BaarcIncrementWidget extends StatelessWidget {
  const BaarcIncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return BlocProvider.value(
                          value: context.read<BaarcIncrementBloc>(),
                          child: const BaarcCounterpage());
                      // return BaarcCounterpage();
                    },
                  ),
                );
              },
              child: Text("Show counter")),
          ElevatedButton(
              onPressed: () {
                context
                    .read<BaarcIncrementBloc>()
                    .add(ChangeBaarcIncrementEvent());
              },
              child: Text("Increment counter")),
        ],
      ),
    );
  }
}
