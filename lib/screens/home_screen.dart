import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tamutamu/models/food_category.dart';
import 'package:tamutamu/widgets/bottom_nav_bar.dart';

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
      bottomNavigationBar: BottomNavBar(),
      // providing a floating app bar for the application
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                'TamuTamu',
                style: TextStyle(fontSize: 30.0),
              ),
              centerTitle: true,
              actions: [Icon(Icons.shopping_cart), SizedBox(width: 10.0)],
              // reveal appbar if user scrolls back up the List
              floating: true,
              pinned: true,
              expandedHeight: 150.0,
            ),
            SliverList(
              // delegate used for the building of items as they are scrolled onsreen
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item #$index')),
                childCount: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
