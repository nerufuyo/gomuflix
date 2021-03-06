import 'dart:async';
import 'package:gomucore/gomucore.dart';
import 'package:sqflite/sqflite.dart';

class GomuflixTvDatasourceHandler {
  // Declarate Variable
  static GomuflixTvDatasourceHandler? gomuDatabaseHandlerVar;

  static Database? gomuDatabaseVar;

  static const String gomuTblWathclistVar = 'watchlist_tv';

  // Callback Variable
  GomuflixTvDatasourceHandler._instance() {
    gomuDatabaseHandlerVar = this;
  }

  // Return Null Value
  factory GomuflixTvDatasourceHandler() =>
      gomuDatabaseHandlerVar ?? GomuflixTvDatasourceHandler._instance();

  // Initial Database
  Future<Database?> get database async {
    gomuDatabaseVar ??= await _initDb();

    // Return Value
    return gomuDatabaseVar;
  }

  // Get Database Path
  Future<Database> _initDb() async {
    // Declarate Variable
    final path = await getDatabasesPath();

    final databasePath = '$path/ditonton_tv.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);

    // Return Value
    return db;
  }

  // Create Table n Database
  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $gomuTblWathclistVar (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  // Get Tv By Id Database
  Future<Map<String, dynamic>?> getGomuTvByIdHandler(int id) async {
    // Declare Variable
    final databaseVar = await database;

    final results = await databaseVar!
        .query(gomuTblWathclistVar, where: 'id = ?', whereArgs: [id]);

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  // Get Watchlist Tv Database
  Future<List<Map<String, dynamic>>> getGomuTvWatchlistHandler() async {
    // Declarate Variable
    final databaseVar = await database;

    final List<Map<String, dynamic>> results =
        await databaseVar!.query(gomuTblWathclistVar);

    // Return Value
    return results;
  }

  // Add Tv to Watchlist Database
  Future<int> insertGomuTvWatchlistHandler(GomuflixTvWatchlistModel tv) async {
    // Declare Variable
    final databaseVar = await database;

    // Return Value
    return await databaseVar!.insert(gomuTblWathclistVar, tv.toJson());
  }

  // Remove Tv to Watchlist Database
  Future<int> removeGomuTvWatchlistHandler(GomuflixTvWatchlistModel tv) async {
    // Declare Variable
    final databaseVar = await database;

    // Return Value
    return await databaseVar!
        .delete(gomuTblWathclistVar, where: 'id = ?', whereArgs: [tv.id]);
  }
}
