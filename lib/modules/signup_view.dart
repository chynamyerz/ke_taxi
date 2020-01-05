import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ke_taxi/routes/Routes.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/modules/signin_view.dart';
import 'package:ke_taxi/graphql/mutation.dart';

class SignupView extends StatefulWidget {
  static const String routeName = '/signup';

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _cell;
  String _password;
  String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        documentNode: gql(signupMutation()),
        onCompleted: (dynamic resultData) async {
          String token = resultData['signup']['token'];

          print(token);

          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString(
              'token', (token != null && token.length > 0) ? token : "");

          Navigator.pushReplacementNamed(context, Routes.home);
        },
      ),
      builder: (
        RunMutation runMutation,
        QueryResult result,
      ) {
        return new Scaffold(
          appBar: AppBar(
            title: Text("Signup"),
          ),
          drawer: AppDrawer(),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Create an account',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 2.0,
                          ),
                        ),
                        Center(
                          child: Text(
                            'unlock the easy way of public transport',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.normal),
                            textScaleFactor: 1.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Full Name',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.orangeAccent,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                focusColor: Colors.orange),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your Full Name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon:
                                  Icon(Icons.mail, color: Colors.orangeAccent),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a Valid Email';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Cellphone no.',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.orangeAccent),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your Cellphone number';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _cell = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon: Icon(Icons.lock_open,
                                  color: Colors.orangeAccent),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid ';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 10.0, right: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.orangeAccent),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _confirmPassword = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: RaisedButton(
                                color: Colors.orange,
                                onPressed: () {
                                  if (_password != _confirmPassword) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Alert"),
                                            content:
                                                Text("Passwords do not match"),
                                          );
                                        });
                                  } else {
                                    runMutation({
                                      'email': _email,
                                      'name': _name,
                                      'cell': _cell,
                                      'password': _password,
                                    });
                                  }
                                },
                                child: Text('Signup'),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account? '),
                            GestureDetector(
                              child: Text("Signin",
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SigninView()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
