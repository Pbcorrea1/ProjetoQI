import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'parking_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE alarms (number INTEGER PRIMARY KEY AUTOINCREMENT,alarmHour CHAR(5) NOT NULL,medicationName CHAR(15) NOT NULL);');
      },
    );
  }
}