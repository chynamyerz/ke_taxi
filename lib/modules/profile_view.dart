import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class ProfileView extends StatelessWidget {
  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Profile")));
  }
}