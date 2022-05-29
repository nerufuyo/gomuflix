import 'dart:async';
import 'package:gomuflix/data/models/gomu_movie_models.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static DatabaseHandler? databaseHandler;
  static Database? databaseVar;
  static const String watchlistButton = 'watchlist';

  void onCreate(database, version) async {
    await database.execute('''
      CREATE TABLE  $watchlistButton (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  DatabaseHandler.instance() {
    databaseHandler = this;
  }

  factory DatabaseHandler() => databaseHandler ?? DatabaseHandler.instance();

  // Initial Database
  Future<Database?> get database async {
    // ignore: prefer_conditional_assignment
    if (databaseVar == null) {
      databaseVar = await initDb();
    }
    return databaseVar;
  }

  // Get Database Path
  Future<Database> initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var database =
        await openDatabase(databasePath, version: 1, onCreate: onCreate);
    return database;
  }

  // Add Movie to Watchlist
  Future<int> insertGomuWatchlistMovie(GomuflixMovieWatchlistModel data) async {
    final db = await database;
    return await db!.insert(watchlistButton, data.toJson());
  }

  // Remove Movie to Watchlist
  Future<int> removeGomuWatchlistMovie(GomuflixMovieWatchlistModel data) async {
    final db = await database;
    return await db!.delete(
      watchlistButton,
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // Get Movie by Id
  Future<Map<String, dynamic>?> getGomuMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      watchlistButton,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  // Get Watchlist Movie
  Future<List<Map<String, dynamic>>> getGomuWatchlistMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(watchlistButton);

    return results;
  }
}
