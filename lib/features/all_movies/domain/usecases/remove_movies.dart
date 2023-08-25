
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies_list.dart';


import '../../../../core/usecase/usecase.dart';
import '../repository/movies_repository.dart';

class RemoveMovieUseCase implements UseCase<void,MoviesListEntity>{
  
  final MoviesRepository _moviesRepository;

  RemoveMovieUseCase(this._moviesRepository);
  
  @override
  Future<void> call({MoviesListEntity ? params}) {
    return _moviesRepository.removeMovie(params!);
  }
  
}