/// Meal Category model class. Interacts with the database
class MealCategory {
  int categoryId;
  String categoryName;

  // constructor
  MealCategory(this.categoryId, this.categoryName);

  // return a map
  Map<String, dynamic> toMap() {
    return {
      "categoryId": (categoryId == 0) ? null : categoryId,
      "categoryName": categoryName,
    };
  }
}
