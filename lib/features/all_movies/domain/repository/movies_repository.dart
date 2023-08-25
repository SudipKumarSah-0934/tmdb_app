

import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/movies_list.dart';

abstract class MoviesRepository {
  // API methods
  Future<DataState<MoviesEntity>> getNowPlayingMoviesList();

  // Database methods
  Future < List < MoviesListEntity >> getSavedMovies();

  Future < void > saveMovie(MoviesListEntity article);

  Future < void > removeMovie(MoviesListEntity article);
}