import 'package:flutter/material.dart';
import 'package:ke_taxi/modules/home_view.dart';
import 'package:ke_taxi/widgets/drawer.dart';

class TripView extends StatefulWidget {
  final int passengers;
  final String selectedFromLocation;
  final String selectedToLocation;

  const TripView(this.passengers, this.selectedFromLocation, this.selectedToLocation);

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  Future<bool> driverArrivedAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Trip"),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      "You are in a trip",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                    child: Text("34 min", style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
              Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(13, 13, 20, 10),
                child: Row(
                  children: <Widget>[
                    Column(
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
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '77 5th Road halfway Gardens',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          Text(
                            'Calsward Lifestyle shooping',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.departure_board,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RaisedButton(
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
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
          Container(
            child: Center(
              child: Image.asset('assets/taxidup.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
