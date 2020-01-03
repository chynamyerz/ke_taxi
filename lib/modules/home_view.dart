import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/routes/Rroutes.dart';

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

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(
      new DropdownButton(
 
        icon: Icon(Icons.keyboard_arrow_down),
        hint: new Text('From'),
        items: locationList,
        value: _selectedFromLocation,
        underline: Container(
          height: 2,
          color: Colors.white,
        ),

        onChanged: (value) {
          setState(() {
            _selectedFromLocation = value;
          });
        },
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


  @override
  Widget build(BuildContext context) {
    loadGenderList();

    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          Container(
            child: Center(
              child: Text(
                'signin',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomSheet: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
            color: Color(0xFF2A2E43),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0))),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 15, 0.0, 25.0),
              child: Text(
                "Ride Sharing:",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 100,
                    child: Card(
                      color: Color(0xFF353A50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            color: Color(0xFFF4911E),
                            icon: Icon(Icons.person),
                            onPressed: () {
                              setState(() {
                                /** */
                              });
                            },
                          ),
                          Text(
                            'Only Me',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 100,
                    child: Card(
                      color: Color(0xFF353A50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            color: Color(0xFFF4911E),
                            icon: Icon(Icons.group_add),
                            onPressed: () {
                              setState(() {
                                /** */
                              });
                            },
                          ),
                          Text(
                            'Group',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
              child: Text(
                'Ride for 5 people',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 20, 10.0, 15.0),
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                color: Color(0xFFF4911E),
                onPressed: () {},
                child: Text(
                  'CALL TAXI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            elevation: 3.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      children: getFormWidget(),
                    ),
                  ),
                ),

                //  new ListView(
                //   children: getFormWidget(),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
