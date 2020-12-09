import 'package:flutter/material.dart';
import 'package:tamutamu/models/food_category.dart';

class LunchBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('${FoodCategory().lunchMeals[index]}'),
      ),
      itemCount: FoodCategory().lunchMeals.length,
    );
  }
}
