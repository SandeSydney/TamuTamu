import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tamutamu/models/food_category.dart';
import 'package:tamutamu/widgets/app_drawer.dart';
import 'package:tamutamu/widgets/bottom_nav_bar.dart';
import 'package:tamutamu/widgets/breakfast_builder.dart';
import 'package:tamutamu/widgets/dinner_builder.dart';
import 'package:tamutamu/widgets/lunch_builder.dart';

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
        appBar: AppBar(
          title: Text(
            'TamuTamu',
            style: TextStyle(fontSize: 24.0),
          ),
          centerTitle: true,
          actions: [Icon(Icons.shopping_cart), SizedBox(width: 10.0)],
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            BreakfastBuilder(),
            LunchBuilder(),
            DinnerBuilder(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
