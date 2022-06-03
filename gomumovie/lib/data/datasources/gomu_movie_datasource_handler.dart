import 'dart:async';
import 'package:gomumovie/gomumovie.dart';
import 'package:sqflite/sqflite.dart';

class GomuflixMovieDatasourceHandler {
  // Declare Variable
  static GomuflixMovieDatasourceHandler? gomuDatabaseHandlerVar;
  static Database? gomuDatabaseVar;
  static const String gomuTblWatchlistVar = 'watchlist_movie';

  // Callback Variable
  GomuflixMovieDatasourceHandler._instance() {
    gomuDatabaseHandlerVar = this;
  }

  // Return Null Value
  factory GomuflixMovieDatasourceHandler() =>
      gomuDatabaseHandlerVar ?? GomuflixMovieDatasourceHandler._instance();

  // Initial Database
  Future<Database?> get database async {
    gomuDatabaseVar ??= await _initDb();
    return gomuDatabaseVar;
  }

  // Get Database Path
  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton_movie.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  // Create Table on Database
  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $gomuTblWatchlistVar (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  // Get Movie By Id Database
  Future<Map<String, dynamic>?> getGomuMovieByIdHandler(int id) async {
    final db = await database;
    final results = await db!.query(
      gomuTblWatchlistVar,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  // Get Watchlist Movie Database
  Future<List<Map<String, dynamic>>> getGomuMovieWatchlistHandler() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(gomuTblWatchlistVar);

    return results;
  }

  // Add Movie To Watchlist Database
  Future<int> insertGomuMovieWatchlistHandler(
      GomuflixMovieWatchlistModel movie) async {
    final db = await database;
    return await db!.insert(gomuTblWatchlistVar, movie.toJson());
  }

  // Remove Movie To Watchlist Database
  Future<int> removeGomuMovieWatchlistHandler(
      GomuflixMovieWatchlistModel movie) async {
    final db = await database;
    return await db!.delete(
      gomuTblWatchlistVar,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }
}
