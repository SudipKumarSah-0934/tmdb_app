import 'package:floor/floor.dart';
import 'package:updated_tmdb_app/features/all_movies/data/models/movies_list_model.dart';

@dao
abstract class MoviesListDao {
  
  @Insert()
  Future<void> insertMoviesList(MoviesListModel moviesList);
  
  @delete
  Future<void> deleteMoviesList(MoviesListModel moviesListModel);
  
  @Query('SELECT * FROM moviesList')
  Future<List<MoviesListModel>> getMoviesList();
}