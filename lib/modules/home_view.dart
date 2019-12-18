import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Home")));
  }
}