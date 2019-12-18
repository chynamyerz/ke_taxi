import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class AboutView extends StatelessWidget {
  static const String routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("About us"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("About us")));
  }
}