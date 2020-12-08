import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tamutamu/models/food_category.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.black54,
          labelColor: Colors.blue,
          tabs: [
            Tab(icon: Icon(Icons.breakfast_dining), text: 'Breakfast'),
            Tab(icon: Icon(Icons.lunch_dining), text: 'Lunch'),
            Tab(icon: Icon(Icons.dinner_dining), text: 'Dinner'),
          ],
        ),
        appBar: AppBar(
          title: Text(
            'TamuTamu',
            style: TextStyle(fontSize: 24.0),
          ),
          centerTitle: true,
          actions: [Icon(Icons.shopping_cart), SizedBox(width: 10.0)],
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text('${FoodCategory().breakfastMeals[index]}'),
              ),
              itemCount: FoodCategory().breakfastMeals.length,
            ),
            ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text('${FoodCategory().lunchMeals[index]}'),
              ),
              itemCount: FoodCategory().breakfastMeals.length,
            ),
            ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text('${FoodCategory().dinnerMeals[index]}'),
              ),
              itemCount: FoodCategory().breakfastMeals.length,
            ),
          ],
        ),
      ),
    );
  }
}
