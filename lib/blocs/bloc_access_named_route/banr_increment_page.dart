import 'package:bloc_demo/blocs/bloc_access_named_route/banr_counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'banr_increment_bloc.dart';

class BanrIncrementPage extends StatefulWidget {
  @override
  State<BanrIncrementPage> createState() => _BanrIncrementPageState();
}

class _BanrIncrementPageState extends State<BanrIncrementPage> {
  final incrementBloc = BanrIncrementBloc();

  @override
  void dispose() {
    incrementBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Named Route",
      routes: {
        '/': (context) => BlocProvider.value(
              value: incrementBloc,
              child: const BanrIncrementWidget(),
            ),
        '/counter': (context) => BlocProvider.value(
              value: incrementBloc,
              child: const BanrCounterpage(),
            ),
      },
    );
  }
}

class BanrIncrementWidget extends StatelessWidget {
  const BanrIncrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/counter');
                },
                child: Text("Show counter")),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<BanrIncrementBloc>()
                      .add(ChangeBanrIncrementEvent());
                },
                child: Text("Increment counter")),
          ],
        ),
      ),
    );
  }
}
