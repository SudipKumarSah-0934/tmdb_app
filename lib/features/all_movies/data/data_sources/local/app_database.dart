
import 'package:floor/floor.dart';
import 'package:updated_tmdb_app/features/all_movies/data/data_sources/local/DAO/article_dao.dart';
import 'package:updated_tmdb_app/features/all_movies/data/models/movies_list_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [MoviesListModel])
abstract class AppDatabase extends FloorDatabase {
  MoviesListDao get moviesDAO;
}