import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // remove padding
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/images/TamuTamu.png'),
          ),
          ListTile(
            title: Text('Shopping Cart'),
          ),
          ListTile(
            title: Text('How to use TamuTamu App'),
          ),
          ListTile(
            title: Text('Terms and Conditions'),
          ),
          ListTile(
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
