import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:updated_tmdb_app/features/all_movies/domain/entities/movies_list.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../injection_container.dart';
import '../../bloc/movies/local/local_movie_bloc.dart';
import '../../bloc/movies/local/local_movie_event.dart';

class MovieDetailsView extends HookWidget {
  final MoviesListEntity? article;

  const MovieDetailsView({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalMovieBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
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
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMovieTitleAndDate(),
          _buildMovieImage(),
          _buildMovieDescription(),
        ],
      ),
    );
  }

  Widget _buildMovieTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            article!.title!,
            style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 14),
          // DateTime
          Row(
            children: [
              const Icon(Icons.calendar_month_rounded, size: 20),
              const SizedBox(width: 4),
              Text(
                article!.releaseDate!,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMovieImage() {
    return Container(
        width: double.maxFinite,
        height: 250,
        margin: const EdgeInsets.only(top: 14),
        child: CachedNetworkImage(
            imageUrl: '$moviesBaseImgUrl${article!.posterPath}',
            imageBuilder: (context, imageProvider) => Padding(
                  padding: const EdgeInsetsDirectional.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill)),
                    ),
                  ),
                ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ),
                ),
            errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                      ),
                      child: const Icon(Icons.error),
                    ),
                  ),
                )));
  }

  Widget _buildMovieDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 30,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    article!.voteAverage!.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.how_to_vote_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    article!.voteCount!.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article!.overview ?? '',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalMovieBloc>(context).add(SaveMovie(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Movie saved successfully.'),
      ),
    );
  }
}
