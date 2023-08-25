import 'package:equatable/equatable.dart';

import '../../data/models/movies_list_model.dart';
import '../../data/models/movies_model.dart';

class MoviesEntity extends Equatable {
  final Dates? dates;
  final int? page;
  final List<MoviesListModel>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesEntity(
      {
        this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults
      });

  @override
  List<Object?> get props {
    return [
     dates,
      page,
      results,
      totalPages,
      totalResults
    ];
  }
}
