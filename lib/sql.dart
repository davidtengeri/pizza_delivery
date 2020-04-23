import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// This class manages the database connection
class Sql {
  Database _database;

  // Opens the database and sets the reference for later usage.
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await openDatabase(
      // Create a file path to the DB
      join(
        await getDatabasesPath(),
        'pizza_delivery.db',
      ),
      version: 2,
      // Creates the database and sets the version. If the version is incremented onUpdate will run
      onCreate: (db, version) async {
        // Separate execute calls needed if multiple tables are created
        await db.execute('''
        CREATE TABLE profile(
          id INTEGER PRIMARY KEY,
          name TEXT,
          email TEXT, 
          phone TEXT
        );
        ''');
        await db.execute('''
        CREATE TABLE addresses(
          id INTEGER PRIMARY KEY,
          city TEXT,
          street TEXT,
          houseNumber TEXT,
          lat REAL,
          lng REAL
        );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion == 1 && newVersion == 2) {
          await db.execute('''
          ALTER TABLE addresses ADD COLUMN lat REAL;
          ''');
          await db.execute('''
          ALTER TABLE addresses ADD COLUMN lng REAL;
          ''');
        }
      },
    );
    return _database;
  }
}
