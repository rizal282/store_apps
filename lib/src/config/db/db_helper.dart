import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  DBHelper.internal();

  factory DBHelper() => _instance;

  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await setDb();

    return _db!;
  }

  static setDb() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "storeappsdb");

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE stores(id INTEGER PRIMARY KEY, store_id TEXT, store_code TEXT, store_name TEXT, address TEXT, dc_id TEXT, dc_name TEXT, account_id TEXT, account_name TEXT, subchannel_id TEXT, subchannel_name TEXT, channel_id TEXT, channel_name TEXT, area_id TEXT, area_name TEXT, region_id TEXT, region_name TEXT, latitude TEXT, longitude TEXT, is_visited TEXT)");
   }
}
