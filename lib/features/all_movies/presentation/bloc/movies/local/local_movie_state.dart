import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movies_list.dart';

abstract class LocalMoviesState extends Equatable {
  final List<MoviesListEntity> ? articles;

  const LocalMoviesState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalMoviesLoading extends LocalMoviesState {
  const LocalMoviesLoading();
}

class LocalMoviesDone extends LocalMoviesState {
  const LocalMoviesDone(List<MoviesListEntity> articles) : super(articles: articles);
}