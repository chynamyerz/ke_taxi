import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> loadLocationList() {
  List<DropdownMenuItem<String>> locationList = [];
  locationList.add(new DropdownMenuItem(
    child: new Text('Taxi Rank'),
    value: 'Taxi Rank',
  ));
  locationList.add(new DropdownMenuItem(
    child: new Text('Down Town'),
    value: 'Down Town',
  ));
  locationList.add(new DropdownMenuItem(
    child: new Text('Ekasi'),
    value: 'Ekasi',
  ));

  return locationList;
}