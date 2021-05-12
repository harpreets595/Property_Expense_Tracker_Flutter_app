import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/brew.dart';
import 'package:flutter_app/screens/home/ViewProperties.dart';
import 'package:flutter_app/screens/home/brew_list.dart';
import 'package:flutter_app/screens/home/settings_form.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';

import 'NewProperty.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return Container(
        child: Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout')),
          FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('setting')),
        ],
      ),
      body: Center(
          child: Column(
          children: [
            ElevatedButton.icon(
              label: Text('Add a New Property'),
              icon: Icon(Icons.web),
              onPressed: () {
                print('Pressed');
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewProperty())
                  );
              },
            ),
            ElevatedButton.icon(
              label: Text('View Your Properties'),
              icon: Icon(Icons.web),
              onPressed: () {
                print('Pressed');
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewProperties())
                  );
              },
            )
          ],
        )),
    ));
  }
}
