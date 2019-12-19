import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedFromLocation;
  int _selectedToLocation;

  List<DropdownMenuItem<int>> locationList = [];

  void loadGenderList() {
    locationList = [];
    locationList.add(new DropdownMenuItem(
      child: new Text('Taxi Rank'),
      value: 0,
    ));
    locationList.add(new DropdownMenuItem(
      child: new Text('Down Town'),
      value: 1,
    ));
    locationList.add(new DropdownMenuItem(
      child: new Text('Ekasi'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: AppDrawer(),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Column(
                children: getFormWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(
      new DropdownButton(
        hint: new Text('Please choose pick up location'),
        items: locationList,
        value: _selectedFromLocation,
        onChanged: (value) {
          setState(() {
            _selectedFromLocation = value;
          });
        },
        isExpanded: true,
      ),
    );
    formWidget.add(
      new DropdownButton(
        hint: new Text('Please choose destination location'),
        items: locationList,
        value: _selectedToLocation,
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (value) {
          setState(() {
            _selectedToLocation = value;
          });
        },
        isExpanded: true,
      ),
    );

    return formWidget;
  }
}
