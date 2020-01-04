import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/location_list.dart';

List<Widget> getFormWidget(fromLocation, toLocation) {
  List<Widget> formWidget = new List();

  formWidget.add(
    new DropdownButton(
      icon: Icon(Icons.keyboard_arrow_down),
      hint: new Text('From'),
      items: loadLocationList(),
      value: fromLocation,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (value) {},
      isExpanded: true,
    ),
  );

  formWidget.add(
    Divider(
      color: Colors.black,
      height: 2,
    ),
  );

  formWidget.add(
    new DropdownButton(
      icon: Icon(Icons.keyboard_arrow_down),
      hint: new Text('To'),
      items: loadLocationList(),
      value: toLocation,
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (value) {},
      isExpanded: true,
    ),
  );

  return formWidget;
}