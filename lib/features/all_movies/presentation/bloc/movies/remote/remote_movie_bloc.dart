import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:updated_tmdb_app/features/all_movies/presentation/bloc/movies/remote/remote_movie_event.dart';
import 'package:updated_tmdb_app/features/all_movies/presentation/bloc/movies/remote/remote_movie_state.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_movies.dart';

class RemoteMoviesBloc extends Bloc<RemoteMoviesEvent,RemoteMoviesState> {
  
  final GetMoviesUseCase _getMovieUseCase;
  
  RemoteMoviesBloc(this._getMovieUseCase) : super(const RemoteMoviesLoading()){
    on <GetMovies> (onGetMovies);
  }


  void onGetMovies(GetMovies event, Emitter < RemoteMoviesState > emit) async {
    final dataState = await _getMovieUseCase();

    if (dataState is DataSuccess && dataState.data!=null) {
      emit(
        RemoteMoviesDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        RemoteMoviesError(dataState.error!)
      );
    }
  }
  
}