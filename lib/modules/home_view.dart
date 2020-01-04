import 'package:flutter/material.dart';
import 'package:ke_taxi/modules/signin_view.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/widgets/home_form_widget.dart';
import 'package:ke_taxi/modules/confirm_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedFromLocation;
  String _selectedToLocation;
  int _selectedPassenger = 0;

  List<String> passengers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15"
  ];

  void handleOnChange(key, value) {
    if (key == 'to') {
      setState(() {
        _selectedToLocation = value;
      });
    } else {
      setState(() {
        _selectedFromLocation = value;
      });
    }

  }

  void showCustomDialog(BuildContext context,
      {@required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      @required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Center(
                  child: Text(title),
                ),
                content: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  width: double.maxFinite,
                  height: 70.0,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: passengers
                          .map(
                            (item) => new Container(
                                width: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: FlatButton(
                                    color: _selectedPassenger ==
                                            passengers.indexOf(item) + 1
                                        ? Colors.orange
                                        : Colors.white,
                                    onPressed: () => {
                                      setState(() {
                                        _selectedPassenger =
                                            passengers.indexOf(item) + 1;
                                      }),
                                      print(_selectedPassenger)
                                    },
                                    child: Text(
                                      item,
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                  ),
                                )),
                          )
                          .toList()),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(okBtnText),
                    onPressed: okBtnFunction,
                  ),
                  FlatButton(
                      child: Text(cancelBtnText),
                      onPressed: () => Navigator.pop(context))
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninView(),
                ),
              );
            },
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
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _selectedPassenger = 1;
                        });
                      },
                      child: Container(
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
                                    _selectedPassenger = 1;
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
                    ),
                    FlatButton(
                      onPressed: () {
                        showCustomDialog(context,
                            title: "Pick the number of Passagers",
                            okBtnText: "Save",
                            cancelBtnText: "Cancel",
                            okBtnFunction: () => {
                                  setState(() =>
                                      _selectedPassenger = _selectedPassenger),
                                  Navigator.pop(context),
                                });
                      },
                      child: Container(
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
                                  {
                                    showCustomDialog(context,
                                        title: "Pick the number of Passagers",
                                        okBtnText: "Save",
                                        cancelBtnText: "Cancel",
                                        okBtnFunction: () => {
                                              setState(() {
                                                _selectedPassenger =
                                                    _selectedPassenger;
                                              }),
                                              Navigator.pop(context),
                                            });
                                  }
                                },
                              ),
                              Text(
                                '+ Group',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                child: Text(
                  'Ride for $_selectedPassenger people',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20, 10.0, 15.0),
                width: double.infinity,
                height: 80,
                child: RaisedButton(
                  color: Color(0xFFF4911E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmView(_selectedPassenger,
                            _selectedFromLocation, _selectedToLocation),
                      ),
                    );
                  },
                  child: Text(
                    'CALL TAXI',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
                      children: getFormWidget(_selectedFromLocation, _selectedToLocation, handleOnChange),
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
