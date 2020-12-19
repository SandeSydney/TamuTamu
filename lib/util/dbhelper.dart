import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tamutamu/models/meal_category.dart';
import 'package:tamutamu/models/meals.dart';

/// file contains the methods that are used for the database; CRUD
class DbHelper {
  // version of the database
  final int version = 1;
  // sqlite database
  Database db;

  // open database if it exists or create a new one
  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(
        join(await getDatabasesPath(), 'tamutamu.db'),
        onCreate: (database, version) {
          database.execute(
            'CREATE TABLE mealCategory(categoryId INTEGER PRIMARY KEY,categoryName TEXT)',
          );
          database.execute(
            'CREATE TABLE meals(mealId INTEGER PRIMARY KEY,categoryId INTEGER,mealName TEXT,mealPrice TEXT,' +
                'FOREIGN KEY(categoryId) REFERENCES mealCategory(categoryId))',
          );
        },
        version: version,
      );
    }
    return db;
  }

  // test the database
  Future testDb() async {
    db = await openDb();
    // populate the database
    await db.execute('INSERT INTO mealCategory VALUES(2, "Lunch")');
    await db.execute('INSERT INTO meals VALUES(2, 2, "Ugali", "50 shillings")');
    // read from the database
    List mealCategory = await db.rawQuery('SELECT * FROM mealCategory');
    List meals = await db.query('SELECT * FROM meals');
    // display results in the console
    print(mealCategory[0].toString());
    print(meals[0].toString());
  }

  // insert data into MealCategory
  Future<int> insertMealCategory(MealCategory mealCategory) async {
    int categoryId = await this.db.insert(
          'mealCategory',
          mealCategory.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    return categoryId;
  }

  // insert item to Meals
  Future<int> insertMeals(Meals meals) async {
    int mealId = await this.db.insert('meals', meals.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return mealId;
  }

  // get meal categories from the Database
  Future<List<MealCategory>> getMealCategories() async {
    final List<Map<String, dynamic>> maps = await db.query('mealCategory');
    return List.generate(maps.length, (i) {
      return MealCategory(
        categoryId: maps[i]['categoryId'],
        categoryName: maps[i]['categoryName'],
      );
    });
  }
}
