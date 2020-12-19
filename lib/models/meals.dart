/// model class for the meals in db
class Meals {
  int mealId;
  int categoryId;
  String mealName;
  String mealPrice;
  // meal Image

  Meals(this.mealId, this.categoryId, this.mealName, this.mealPrice);

  // return a map with db data
  Map<String, dynamic> toMap() {
    return {
      "mealId": (mealId == 0) ? null : mealId,
      "categoryId": categoryId,
      "mealName": mealName,
      "mealPrice": mealPrice,
    };
  }
}
