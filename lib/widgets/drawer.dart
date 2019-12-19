import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ke_taxi/routes/Rroutes.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final String userQuery = """
      query{
        user{
          id
          name
          email
          roles
        }
      }
    """;
    return Drawer(
      child: Query(
        options: QueryOptions(
          document: userQuery,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null) {
            return Text(result.errors.toString());
          }

          if (result.loading) {
            return Text('Loading...');
          }

          Map user = result.data['user'];

          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ke Taxi"),
                accountEmail: Text("ketaxi@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "K",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              _createDrawerItem(
                icon: Icons.home,
                text: 'Home',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.home),
              ),
              _createDrawerItem(
                icon: Icons.person,
                text: 'Profile',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.profile),
              ),
              _createDrawerItem(
                icon: Icons.history,
                text: 'History',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.history),
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.info,
                text: 'About us',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.about),
              ),
              _createDrawerItem(
                icon: Icons.contacts,
                text: 'Contact us',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.contact),
              ),
              _createDrawerItem(
                icon: Icons.note,
                text: 'Terms & Conditions',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Routes.policy),
              ),
              ListTile(
                title: Text('0.0.1'),
                onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
