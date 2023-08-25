import 'package:floor/floor.dart';
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies_list.dart';

@Entity(tableName: 'moviesList',primaryKeys: ['id'])
class MoviesListModel extends MoviesListEntity {
  final bool? adult;
  final String? backdropPath;
  final String? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MoviesListModel(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  static double convertRating(dynamic rating) {
    if (rating is int) {
      return rating.toDouble();
    } else if (rating is double) {
      return rating;
    } else {
      throw ArgumentError("Invalid rating type");
    }
  }

  factory MoviesListModel.fromJson(Map<String, dynamic> json) {
    return MoviesListModel(adult : json['adult'],
    backdropPath : json['backdrop_path'],
    genreIds : json['genre_ids'].cast<int>().where((genre) => genre != null).join(','),
    id : json['id'],
    originalLanguage : json['original_language'],
    originalTitle : json['original_title'],
    overview : json['overview'],
    popularity : json['popularity'],
    posterPath : json['poster_path'],
    releaseDate : json['release_date'],
    title : json['title'],
    video : json['video'],
    voteAverage : convertRating(json['vote_average']),
    voteCount : json['vote_count'],);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
  factory MoviesListModel.fromEntity(MoviesListEntity entity) {
    return MoviesListModel(
      adult:entity.adult,
      backdropPath:entity.backdropPath,
      genreIds:entity.genreIds,
      id:entity.id,
      originalLanguage:entity.originalLanguage,
      originalTitle:entity.originalTitle,
      overview:entity.overview,
      popularity:entity.popularity,
      posterPath:entity.posterPath,
      releaseDate:entity.releaseDate,
      title:entity.title,
      video:entity.video,
      voteAverage:convertRating(entity.voteAverage),
      voteCount:entity.voteCount,
    );
  }
  MoviesListEntity toEntity() {
    return MoviesListEntity(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}