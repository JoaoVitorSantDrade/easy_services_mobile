import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:easy_services/hooks/sqlLite_scripts.dart';
import 'package:easy_services/models/easyUserModel.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    // Set the database factory to use sqflite_common_ffi

    String path = await getDatabasesPath();

    return openDatabase(
      join(path, DATABASE_NAME),
      onCreate: (database, version) async {
        await database.execute(CREATE_USER_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future createUser(easyUserModel model) async {
    try {
      final Database db = await initializeDB();

      await db.insert(
        "easy_user",
        model.toJson(),
      );
    } catch (ex) {
      print("Cannot create user - $ex");
      throw Exception("Cannot create user - $ex");
    }
  }

  Future<List<easyUserModel>> getUsers() async {
    try {
      final Database db = await initializeDB();
      final List<Map<String, dynamic>> maps = await db.query("easy_user");

      return List.generate(
        maps.length,
        (i) {
          return easyUserModel.fromJson(maps[i]);
        },
      );
    } catch (ex) {
      throw Exception("Cannot create user - $ex");
      return <easyUserModel>[];
    }
  }

  Future<void> updateUser(easyUserModel model) async {
    try {
      final Database db = await initializeDB();

      await db.update(
        "easy_user",
        model.toJson(),
        where: 'user_id = ?',
        whereArgs: [model.userId],
      );
    } catch (ex) {
      throw Exception("Cannot create user - $ex");
      return;
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      final Database db = await initializeDB();

      await db.delete(
        "easy_user",
        where: 'user_id = ?',
        whereArgs: [userId],
      );
    } catch (ex) {
      throw Exception("Cannot create user - $ex");
      print(ex);
      return;
    }
  }

  Future<void> dropAndRecreateTable() async {
    try {
      final Database db = await initializeDB();

      // Drop the table
      await db.execute("DROP TABLE IF EXISTS easy_user");

      // Recreate the table
      await db.execute(CREATE_USER_TABLE_SCRIPT);

      print('Table dropped and recreated successfully');
    } catch (ex) {
      print('Error during drop and recreate: $ex');
      throw Exception("Cannot create user - $ex");
    }
  }
}
