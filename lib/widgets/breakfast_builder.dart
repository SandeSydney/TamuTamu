import 'package:flutter/material.dart';
import 'package:tamutamu/models/food_category.dart';

class BreakfastBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text('${FoodCategory().breakfastMeals[index]}'),
      ),
      itemCount: FoodCategory().breakfastMeals.length,
    );
  }
}
