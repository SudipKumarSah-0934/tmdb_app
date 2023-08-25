import 'package:updated_tmdb_app/features/all_movies/data/models/movies_list_model.dart';
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies.dart';
class MoviesModel extends MoviesEntity {
  final Dates? dates;
  final int? page;
  final List<MoviesListModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesModel(
      {this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults});
  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,
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
      'dates': dates?.toJson(),
      'page': page,
      'results': results != null
          ? results!.map((x) => x.toJson()).toList()
          : null,
      'totalPages': totalPages,
      'totalResults': totalResults,
    };
  }

}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}

