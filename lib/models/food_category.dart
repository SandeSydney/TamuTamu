import 'dart:collection';

/// FoodCategory class stores the available categories of food offered
class FoodCategory {
  // meals in the breakfast category
  final List<String> _breakfastMeals = [
    'Tea',
    'Coffee',
    'Porridge',
    'Bread',
    'Muffins',
    'Tea',
    'Coffee',
    'Porridge',
    'Bread',
    'Muffins',
    'Tea',
    'Coffee',
    'Porridge',
    'Bread',
    'Muffins',
  ];

  // meals in the lunch category
  final List<String> _lunchMeals = [
    'Mokimo',
    'Gidheri',
    'Ugali',
    'Kienyeji',
    'Rice',
    'Mokimo',
    'Gidheri',
    'Ugali',
    'Kienyeji',
  ];

  // meals in the dinner category
  final List<String> _dinnerMeals = [
    'Pilau',
    'Roast Beef',
    'Eggs',
    'Chicken stew',
    'Pork',
  ];

  // display breakfast meals
  UnmodifiableListView get breakfastMeals {
    return UnmodifiableListView(_breakfastMeals);
  }

  // display lunch meals
  UnmodifiableListView get lunchMeals {
    return UnmodifiableListView(_lunchMeals);
  }

  // display supper meals
  UnmodifiableListView get dinnerMeals {
    return UnmodifiableListView(_dinnerMeals);
  }
}
