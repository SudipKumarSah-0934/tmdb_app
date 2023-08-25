import 'package:equatable/equatable.dart';

import '../../data/models/movies_list_model.dart';

class MoviesTopRatedPopularEntity extends Equatable {
  final int? page;
  final List<MoviesListModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesTopRatedPopularEntity(
      {
        this.page,
        this.results,
        this.totalPages,
        this.totalResults
      });

  @override
  List<Object?> get props {
    return [
      page,
      results,
      totalPages,
      totalResults
    ];
  }
}
