import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'banr_increment_bloc.dart';

class BanrCounterpage extends StatelessWidget {
  const BanrCounterpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BanrIncrementBloc, BanrIncrementState>(
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
