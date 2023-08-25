import 'package:flutter/material.dart';

import '../../features/all_movies/domain/entities/movies_list.dart';
import '../../features/all_movies/presentation/pages/article_detail/article_detail.dart';
import '../../features/all_movies/presentation/pages/home/home_page.dart';
import '../../features/all_movies/presentation/pages/saved_movies/saved_movies.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/MovieDetails':
        return _materialRoute(MovieDetailsView(article: settings.arguments as MoviesListEntity));

      case '/SavedMovies':
        return _materialRoute(const SavedMovies());
        
      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
