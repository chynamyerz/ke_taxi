import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class ContactView extends StatelessWidget {
  static const String routeName = '/contact-us';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Contact us"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Contact us")));
  }
}