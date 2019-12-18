import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class HistoryView extends StatelessWidget {
  static const String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("History")));
  }
}