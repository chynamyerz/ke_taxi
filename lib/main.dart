import 'package:flutter/material.dart';
import 'package:ke_taxi/modules/about_view.dart';
import 'package:ke_taxi/modules/contact_view.dart';
import 'package:ke_taxi/modules/history_view.dart';
import 'package:ke_taxi/modules/policy_view.dart';
import 'package:ke_taxi/modules/profile_view.dart';
import 'package:ke_taxi/modules/signin_view.dart';
import 'package:ke_taxi/modules/signup_view.dart';
import 'package:ke_taxi/routes/Rroutes.dart';
import 'package:ke_taxi/modules/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ke-Taxi',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomeView(),
      routes: {
        Routes.home: (context) => HomeView(),
        Routes.profile: (context) => ProfileView(),
        Routes.history: (context) => HistoryView(),
        Routes.about: (context) => AboutView(),
        Routes.contact: (context) => ContactView(),
        Routes.policy: (context) => PolicyView(),
        Routes.signin: (context) => SigninView(),
        Routes.signup: (context) => SignupView(),
      },
    );
  }
}

