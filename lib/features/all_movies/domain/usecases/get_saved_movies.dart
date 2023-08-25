
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies_list.dart';


import '../../../../core/usecase/usecase.dart';
import '../repository/movies_repository.dart';

class GetSavedMoviesUseCase implements UseCase<List<MoviesListEntity>,void>{
  
  final MoviesRepository _moviesRepository;

  GetSavedMoviesUseCase(this._moviesRepository);
  
  @override
  Future<List<MoviesListEntity>> call({void params}) {
    return _moviesRepository.getSavedMovies();
  }
  
}