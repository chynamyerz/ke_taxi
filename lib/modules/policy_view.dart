import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class PolicyView extends StatelessWidget {
  static const String routeName = '/policy';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Policy"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Terms & Conditions")));
  }
}