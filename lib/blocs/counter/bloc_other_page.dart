import 'package:flutter/material.dart';

class BlocOtherPage extends StatelessWidget {
  const BlocOtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Other",
          style: TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
