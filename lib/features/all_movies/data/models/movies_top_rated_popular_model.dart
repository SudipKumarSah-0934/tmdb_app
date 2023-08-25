import 'package:updated_tmdb_app/features/all_movies/data/models/movies_list_model.dart';
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies.dart';
class MoviesTopRatedPopularModel extends MoviesEntity {
  final int? page;
  final List<MoviesListModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesTopRatedPopularModel(
      {
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});
  factory MoviesTopRatedPopularModel.fromJson(Map<String, dynamic> json) {
    return MoviesTopRatedPopularModel(
      page: json['page'],
      results: json['results'] != null
          ? List<MoviesListModel>.from(
        json['results'].map((x) => MoviesListModel.fromJson(x)),
      )
          : null,
      totalPages: json['totalPages'],
      totalResults: json['totalResults'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results != null
          ? results!.map((x) => x.toJson()).toList()
          : null,
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

}

