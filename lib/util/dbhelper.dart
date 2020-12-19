import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
            '''
            CREATE TABLE meal_category(
              category_id INTEGER PRIMARY KEY,
              category_name TEXT
            )''',
          );
          database.execute(
            '''
            CREATE TABLE meals(
              meal_id INTEGER PRIMARY KEY,
              category_id INTEGER,
              meal_name TEXT,
              meal_price TEXT,
                ''' +
                '''
              FOREIGN KEY(category_id) REFERENCES meal_category(category_id)
            )''',
          );
        },
        version: version,
      );
    }
    return openDb();
  }

  // test the database
  Future testDb() async {
    db = await openDb();
    // populate the database
    await db.execute('INSERT INTO meal_category VALUES(1, "Breakfast")');
    await db.execute('INSERT INTO meals VALUES(1, 1, "Tea", "50 shillings")');
    // read from the database
    List mealCategory = await db.rawQuery('SELECT * FROM meal_category');
    List meals = await db.query('SELECT * FROM meals');
    // display results in the console
    print(mealCategory[0].toString());
    print(meals[0].toString());
  }
}