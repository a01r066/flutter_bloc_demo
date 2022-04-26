import 'package:bloc_demo/blocs/bloc_access_anonymous_route/baarc_increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaarcCounterpage extends StatelessWidget {
  const BaarcCounterpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaarcIncrementBloc, BaarcIncrementState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              "${state.increment}",
              style: TextStyle(fontSize: 52.0),
            ),
          ),
        );
      },
    );
  }
}
