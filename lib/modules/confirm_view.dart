import 'package:flutter/material.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/modules/driver_wait_view.dart';


class ConfirmView extends StatefulWidget {
  static const String routeName = '/confirm';
  final int passagers;
  final String from;
  final String to;

  const ConfirmView(this.passagers, this.from, this.to);

  @override
  _ConfirmViewState createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView> {
  List<DropdownMenuItem<String>> locationList = [];

  void loadLocationList() {
    locationList = [];
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
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(
      new DropdownButton(
        icon: Icon(Icons.keyboard_arrow_down),
        hint: new Text('From'),
        items: locationList,
        value: widget.from,
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
        items: locationList,
        value: widget.to,
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

  Future<bool> driverRequestAction() async {
    //replace the below line of code with your login request
    await new Future.delayed(const Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    loadLocationList();
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
                  Container(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      'Please Confirm Ride Information',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Estimated Pickup Time : 4 mins',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Ride for ${widget.passagers} people',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      'R69.50',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Fare Estimate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity, 
                    height: 80,// match_parent
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RaisedButton(
                          color: Colors.orange,
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            await driverRequestAction();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DriverWaitView(widget.passagers, widget.from, widget.to) ,
                              ),
                            );
                          },
                          child: Text('CONFIRM PICKUP',style: TextStyle(color: Colors.white),),
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
                      
                    Icon(Icons.place,color: Colors.orange,size: 20,),
                    Expanded(child:Container(
  width: 1,
  height: double.maxFinite,
  color: Colors.grey,
) ,),
                     Icon(Icons.album,color: Colors.blueGrey,size:20)

                  ],),),
                Expanded(
                  
                  child:Container(
                    padding: EdgeInsets.only(right: 5),
                    child:Column(
                      children: getFormWidget(),
                    ) ,) ,), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
