import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ke_taxi/routes/Routes.dart';
import 'package:ke_taxi/modules/signup_view.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/graphql/mutation.dart';

class SigninView extends StatefulWidget {
  static const String routeName = '/signin';

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Signin"),
      ),
      drawer: AppDrawer(),
      body: Mutation(
        options: MutationOptions(
          documentNode: gql(signinMutation()),
          onCompleted: (dynamic resultData) async {
            String token = resultData['signin']['token'];

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.setString(
                'token', (token != null && token.length > 0) ? token : "");

            Navigator.pushReplacementNamed(context, Routes.home);
          },
        ),
        builder: (
          RunMutation runMutation,
          QueryResult result,
        ) {
          if (result.loading) {
            return Text('Loading...');
          }
          return Form(
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
                            'Welcome Back!',
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
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon:
                                  Icon(Icons.mail, color: Colors.orange),
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
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.orange),
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
                                _password = value;
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
                                  runMutation({
                                    'email': _email,
                                    'password': _password,
                                  });
                                },
                                child: Text('Signin'),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Dont have an account? '),
                            GestureDetector(
                              child: Text(
                                "Signup",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupView(),
                                  ),
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
          );
        },
      ),
    );
  }
}
