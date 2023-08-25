import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../domain/entities/movies.dart';

abstract class RemoteMoviesState extends Equatable {
  final MoviesEntity ? movies;
  final DioException ? error;
  
  const RemoteMoviesState({this.movies,this.error});
  
  @override
  List<Object> get props => [movies!, error!];
}

class RemoteMoviesLoading extends RemoteMoviesState {
  const RemoteMoviesLoading();
}

class RemoteMoviesDone extends RemoteMoviesState {
  const RemoteMoviesDone(MoviesEntity movie) : super(movies: movie);
}

class RemoteMoviesError extends RemoteMoviesState {
  const RemoteMoviesError(DioError error) : super(error: error);
}