import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:ke_taxi/widgets/drawer.dart';
import 'package:ke_taxi/modules/signup_view.dart';

class SigninView extends StatelessWidget {
  static const String routeName = '/signin';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signinQuery = """
      mutation SIGNIN_MUTATION(\$email: String! \$password: String!){
        signin(email: \$email password: \$password){
          token
        }
      }
    """;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Signin"),
      ),
      drawer: AppDrawer(),
      body: Mutation(
        options: MutationOptions(
          documentNode: gql(signinQuery),
          onCompleted: (dynamic resultData) async {
            String token = resultData['signin']['token'];
            final payload = token.split('.')[1];
            final Map user =
                json.decode(B64urlEncRfc7515.decodeUtf8(payload))['user'];

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            await preferences.setString(
                'token', (token != null && token.length > 0) ? token : "");
          },
        ),
        builder: (
          RunMutation runMutation,
          QueryResult result,
        ) {
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
                                    'email': 'rider@gmail.com',
                                    'password': 'rider',
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
