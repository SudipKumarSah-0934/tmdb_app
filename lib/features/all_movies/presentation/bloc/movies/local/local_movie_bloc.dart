import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_saved_movies.dart';
import '../../../../domain/usecases/remove_movies.dart';
import '../../../../domain/usecases/save_movies.dart';
import 'local_movie_event.dart';
import 'local_movie_state.dart';

class LocalMovieBloc extends Bloc<LocalMoviesEvent,LocalMoviesState> {
  final GetSavedMoviesUseCase _getSavedMovieUseCase;
  final SaveMovieUseCase _saveMovieUseCase;
  final RemoveMovieUseCase _removeMovieUseCase;

  LocalMovieBloc(
    this._getSavedMovieUseCase,
    this._saveMovieUseCase,
    this._removeMovieUseCase
  ) : super(const LocalMoviesLoading()){
    on <GetSavedMovies> (onGetSavedMovies);
    on <RemoveMovie> (onRemoveMovie);
    on <SaveMovie> (onSaveMovie);
  }


  void onGetSavedMovies(GetSavedMovies event,Emitter<LocalMoviesState> emit) async {
    final articles = await _getSavedMovieUseCase();
    emit(LocalMoviesDone(articles));
  }
  
  void onRemoveMovie(RemoveMovie removeMovie,Emitter<LocalMoviesState> emit) async {
    await _removeMovieUseCase(params: removeMovie.article);
    final articles = await _getSavedMovieUseCase();
    emit(LocalMoviesDone(articles));
  }

  void onSaveMovie(SaveMovie saveMovie,Emitter<LocalMoviesState> emit) async {
    await _saveMovieUseCase(params: saveMovie.article);
    final articles = await _getSavedMovieUseCase();
    emit(LocalMoviesDone(articles));
  }
}