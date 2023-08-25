import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/movies_repository.dart';

class GetMoviesUseCase implements UseCase<DataState<MoviesEntity>,void>{
  
  final MoviesRepository _moviesRepository;

  GetMoviesUseCase(this._moviesRepository);
  
  @override
  Future<DataState<MoviesEntity>> call({void params}) {
    return _moviesRepository.getNowPlayingMoviesList();
  }
  
}