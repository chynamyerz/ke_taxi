import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class SigninView extends StatelessWidget {
  static const String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Signin"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Signin")));
  }
}