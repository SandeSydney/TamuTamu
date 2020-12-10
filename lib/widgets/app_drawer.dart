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
            onTap: () {
              // close drawer after selection
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('How to use TamuTamu App'),
            onTap: () {
              // close drawer after selection
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Terms and Conditions'),
            onTap: () {
              // close drawer after selection
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              // close drawer after selection
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
