import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../injection_container.dart';

import '../../../domain/entities/movies_list.dart';
import '../../bloc/movies/local/local_movie_bloc.dart';
import '../../bloc/movies/local/local_movie_event.dart';
import '../../bloc/movies/local/local_movie_state.dart';
import '../../widgets/movie_tile.dart';

class SavedMovies extends HookWidget {
  const SavedMovies({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalMovieBloc>()..add(const GetSavedMovies()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text('Saved Movies', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalMovieBloc, LocalMoviesState>(
      builder: (context, state) {
        if (state is LocalMoviesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalMoviesDone) {
          return _buildMoviesList(state.articles!);
        }
        return Container();
      },
    );
  }

  Widget _buildMoviesList(List<MoviesListEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return MovieWidget(
          movies: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveMovie(context, article),
          onMoviePressed: (article) => _onMoviePressed(context, article),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveMovie(BuildContext context, MoviesListEntity article) {
    BlocProvider.of<LocalMovieBloc>(context).add(RemoveMovie(article));
  }

  void _onMoviePressed(BuildContext context, MoviesListEntity article) {
    Navigator.pushNamed(context, '/MovieDetails', arguments: article);
  }
}
