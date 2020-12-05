import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This Home class presents the app user with a home screen that consists of a
/// row of Food Categories the user ca select and will be sent to the section
/// containing the chosen category of food.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Floating AppBar above the list
      appBar: AppBar(
        title: Text(
          'TamuTamu',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          // TODO: row with categories of food
          FoodCategory(),
          // TODO: build a list, Used a Mixed List
          //ListView.builder(),
        ],
      ),
    );
  }
}

/// this FoodCategory class returns a row widget that has various categories
/// of food that a user of the app can choose using ElevatedButtons
class FoodCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(onPressed: () {}, child: Text('Breakfast')),
          ElevatedButton(onPressed: () {}, child: Text('Snack')),
          ElevatedButton(onPressed: () {}, child: Text('Lunch')),
          ElevatedButton(onPressed: () {}, child: Text('Dinner')),
        ],
      ),
    );
  }
}
