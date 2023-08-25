import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movies_list.dart';

abstract class LocalMoviesEvent extends Equatable {
  final MoviesListEntity ? article;

  const LocalMoviesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedMovies extends LocalMoviesEvent {
  const GetSavedMovies();
}

class RemoveMovie extends LocalMoviesEvent {
  const RemoveMovie(MoviesListEntity article) : super(article: article);
}

class SaveMovie extends LocalMoviesEvent {
  const SaveMovie(MoviesListEntity article) : super(article: article);
}
