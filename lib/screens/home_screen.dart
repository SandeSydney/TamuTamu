import 'package:flutter/material.dart';
import 'package:tamutamu/models/meal_category.dart';
import 'package:tamutamu/models/meals.dart';
import 'package:tamutamu/screens/shopping_cart_screen.dart';
import 'package:tamutamu/util/dbhelper.dart';
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
          actions: [
            GestureDetector(
              onTap: () {
                // TODO: Push to the Shopping Cart Screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShoppingCart()));
              },
              child: Icon(Icons.shopping_cart),
            ),
            SizedBox(width: 10.0)
          ],
        ),
        drawer: AppDrawer(),
        body: MealsList(),
        // body: TabBarView(
        //   children: <Widget>[
        //     BreakfastBuilder(),
        //     LunchBuilder(),
        //     DinnerBuilder(),
        //   ],
        // ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class MealsList extends StatefulWidget {
  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  DbHelper helper = DbHelper();
  // List of meal categories
  List<MealCategory> mealCategoriesList;
  @override
  Widget build(BuildContext context) {
    showData();
    return ListView.builder(
      itemCount: (mealCategoriesList != null) ? mealCategoriesList.length : 0,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text(mealCategoriesList[index].categoryName),
        );
      },
    );
  }

  // display data from database
  Future showData() async {
    await helper.openDb();

    // get the meal categories from the database
    mealCategoriesList = await helper.getMealCategories();
    // show state when List Changes
    setState(() {
      mealCategoriesList = mealCategoriesList;
    });
  }
}
