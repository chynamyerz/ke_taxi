import 'package:flutter/material.dart';
import 'package:ke_taxi/modules/home_view.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/widgets/form_widget.dart';
import 'package:ke_taxi/modules/trip_view.dart';

class DriverWaitView extends StatefulWidget {
  final int passengers;
  final String selectedFromLocation;
  final String selectedToLocation;

  const DriverWaitView(
    this.passengers,
    this.selectedFromLocation,
    this.selectedToLocation,
  );

  @override
  _DriverWaitViewState createState() => _DriverWaitViewState();
}

class _DriverWaitViewState extends State<DriverWaitView> {
  @override
  void initState() {
    driverArrivedAction();
    super.initState();
  }

  driverArrivedAction() async {
    //replace the below line of code with your driver arrived logic
    await new Future.delayed(const Duration(seconds: 5));
    return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              TripView(widget.passengers, widget.selectedToLocation, widget.selectedFromLocation)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("On it way"),
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
            onPressed: () {},
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      bottomSheet: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            ),
          ],
          color: Color(0xFF2A2E43),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
          ),
        ),
        height: 300,
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          "Your Ride",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    leading: IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.time_to_leave,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Ryan Brown",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Quantum - CY 764 GP",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Card(
                      color: Color(0xFF353A50),
                      child: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Please wait driver on the way",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 80, // match_parent
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RaisedButton(
                          color: Colors.orange,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()),
                            );
                          },
                          child: Text(
                            'CANCEL PICKUP',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            elevation: 3.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 7, 5),
                  height: 80,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Expanded(
                        child: Container(
                          width: 1,
                          height: double.maxFinite,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.album,
                        color: Colors.blueGrey,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Column(
                      children: getFormWidget(widget.selectedFromLocation, widget.selectedToLocation),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
