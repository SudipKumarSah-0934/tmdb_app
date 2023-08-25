// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MoviesListDao? _moviesDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `moviesList` (`adult` INTEGER, `backdropPath` TEXT, `genreIds` TEXT, `id` INTEGER, `originalLanguage` TEXT, `originalTitle` TEXT, `overview` TEXT, `popularity` REAL, `posterPath` TEXT, `releaseDate` TEXT, `title` TEXT, `video` INTEGER, `voteAverage` REAL, `voteCount` INTEGER, `adult` INTEGER, `backdropPath` TEXT, `genreIds` TEXT, `id` INTEGER, `originalLanguage` TEXT, `originalTitle` TEXT, `overview` TEXT, `popularity` REAL, `posterPath` TEXT, `releaseDate` TEXT, `title` TEXT, `video` INTEGER, `voteAverage` REAL, `voteCount` INTEGER, PRIMARY KEY (`id`, `id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MoviesListDao get moviesDAO {
    return _moviesDAOInstance ??= _$MoviesListDao(database, changeListener);
  }
}

class _$MoviesListDao extends MoviesListDao {
  _$MoviesListDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _moviesListModelInsertionAdapter = InsertionAdapter(
            database,
            'moviesList',
            (MoviesListModel item) => <String, Object?>{
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdropPath': item.backdropPath,
                  'genreIds': item.genreIds,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdropPath': item.backdropPath,
                  'genreIds': item.genreIds,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                }),
        _moviesListModelDeletionAdapter = DeletionAdapter(
            database,
            'moviesList',
            ['id', 'id'],
            (MoviesListModel item) => <String, Object?>{
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdropPath': item.backdropPath,
                  'genreIds': item.genreIds,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdropPath': item.backdropPath,
                  'genreIds': item.genreIds,
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MoviesListModel> _moviesListModelInsertionAdapter;

  final DeletionAdapter<MoviesListModel> _moviesListModelDeletionAdapter;

  @override
  Future<List<MoviesListModel>> getMoviesList() async {
    return _queryAdapter.queryList('SELECT * FROM moviesList',
        mapper: (Map<String, Object?> row) => MoviesListModel(
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String?,
            genreIds: row['genreIds'] as String?,
            id: row['id'] as int?,
            originalLanguage: row['originalLanguage'] as String?,
            originalTitle: row['originalTitle'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            releaseDate: row['releaseDate'] as String?,
            title: row['title'] as String?,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double?,
            voteCount: row['voteCount'] as int?));
  }

  @override
  Future<void> insertMoviesList(MoviesListModel moviesList) async {
    await _moviesListModelInsertionAdapter.insert(
        moviesList, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMoviesList(MoviesListModel moviesListModel) async {
    await _moviesListModelDeletionAdapter.delete(moviesListModel);
  }
}
