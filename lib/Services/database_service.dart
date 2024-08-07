// ignore_for_file: depend_on_referenced_packages

import 'package:movie_app/models/movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'movie.db'),
      version: 20,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE movies ('
          'movie_id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'id INTEGER, '
          'adult TEXT, '
          'backdrop_path TEXT, '
          'genre_ids BLOB, '
          'original_language TEXT, '
          'original_title TEXT, '
          'overview TEXT, '
          'popularity REAL, '
          'poster_path TEXT, '
          'release_date TEXT, '
          'title TEXT, '
          'video TEXT, '
          'vote_average REAL, '
          'vote_count INTEGER'
          ')',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute('ALTER TABLE movies ADD COLUMN backdrop_path TEXT');
        }
      },
    );
  }

  Future<void> insert(MovieModel movie) async {
    final db = await database;
    try {
      logger.d('Inserting movie: ${movie.title}');
      await db.insert(
        'movies',
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      logger.d('Movie inserted successfully: ${movie.title}');
    } catch (e) {
      logger.e(
        'Error inserting movie: ${movie.title} $e',
      );
    }
  }

  Future<List<MovieModel>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      return MovieModel.fromMap(maps[i]);
    });
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final db = await database;
    await db.delete('movies');
  }

  Future<MovieModel?> getMovieById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'movies',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return MovieModel.fromMap(maps.first);
    }
    return null;
  }
}
