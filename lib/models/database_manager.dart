import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Class to manage the database
class DatabaseManager {
  // instance of the database
  Database _database;

  // function to create the database or return an existing database
  Future openDB() async {
    // if database does not exist, create one. Else return database
    if (_database == null) {
      // get the path to where the database has been created
      _database = await openDatabase(
        join(await getDatabasesPath(), "tamutamuDB.db"),
        version: 1,
        // create table once Db is created
        onCreate: (Database db, int version) async {
          await db.execute('''
        CREATE TABLE meals(
          mealId, INTEGER PRIMARYKEY autoincrement,
          categoryId, INTERGER,
          mealTitle, TEXT
          )
        ''');
        },
      );
    } else {
      return _database;
    }
  }

  // function to add meals into the database
  Future<int> insertMeals(Meals meals) async {
    await openDB();
    return await _database.insert('meals', meals.toMap());
  }

  // function to fetch the list of meals in the database
  Future<List<Meals>> getMealList() async{
    await openDB();
    final List<Map<String, dynamic>> maps = await _database.query('meals');

    return List.generate(maps.length, (index){
      return Meals(
        mealId: maps[index]['mealId'],
        categoryId: maps[index]['categoryId'],
        meanTitle: maps[index]['mealTitle'],
      )
    });
  }

  // function to update the meals in the database
  Future<int> updateMeals(Meals meals) async{
    await openDB();
    return await _database.update('meals', meals.toMap, where: "mealId = ?", whereArgs: [meals.mealId],);
  }

  // function to delete meals in the database
  Future<int> deleteMeals(int mealId) async
  await openDB();
  return await _database.delete('meals', where: "mealId = ?", whereArgs: [mealId],);
}

/// Meals Model class
class Meals {
  int mealId;
  int categoryId;
  String mealTitle;

  // Meeals constructor
  Meals({
    @required this.mealTitle,
    @required this.categoryId,
  });
  // convert the data to a map
  Map<String, dynamic> toMap() {
    return {'mealId': mealId, 'mealTitle': mealTitle, 'categoryId': categoryId};
  }
}
