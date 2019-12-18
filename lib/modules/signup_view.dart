import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class SignupView extends StatelessWidget {
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Signup")));
  }
}