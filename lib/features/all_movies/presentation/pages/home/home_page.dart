import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:updated_tmdb_app/features/all_movies/data/models/movies_list_model.dart';
import '../../../domain/entities/movies_list.dart';
import '../../bloc/movies/remote/remote_movie_bloc.dart';
import '../../bloc/movies/remote/remote_movie_state.dart';
import '../../widgets/movie_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.black,
  );
  Widget appBarTitle = const Text(
    "Now Showing",
    style: TextStyle(color: Colors.black, fontSize: 25),
  );
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late bool _isSearching = false;
  late FocusNode _searchFocusNode; // Declare the FocusNode
  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }
  @override
  void dispose() {
    _searchFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: appBarTitle,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(
                  Icons.close,
                  color: Colors.red,
                );
                appBarTitle = TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _isSearching = true;
                    });
                  },
                  textInputAction: TextInputAction.go,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.black)),
                );
                _searchFocusNode.requestFocus();
              } else {
                actionIcon = const Icon(Icons.search, color: Colors.black);
                appBarTitle = const Text(
                  'Now Showing',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                );
                _isSearching = false;
                _searchController.text = "";
                _searchFocusNode.unfocus();
              }
            });
          },
          icon: actionIcon,
        ),
        GestureDetector(
          onTap: () => _onShowSavedMoviesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              child: Icon(
                Icons.bookmark,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionsList(List<MoviesListModel> allMovies) {
    Set<String> addedTitles = {}; // Set to track added movie titles
    List<MoviesListEntity> suggestions = []; // List to hold suggestions

    if (_searchQuery.isNotEmpty) {
      for (var movie in allMovies) {
        if (movie.title!.toLowerCase().contains(_searchQuery.toLowerCase()) &&
            !addedTitles.contains(movie.title!.toLowerCase())) {
          suggestions.add(movie);
          addedTitles.add(movie.title!.toLowerCase());
        }
      }
    }

    if (_searchQuery.isEmpty || suggestions.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final movie = suggestions[index];
        return MovieWidget(
          movies: movie,
          onMoviePressed: (movie) =>
              _onMoviePressed(context, movie),
        );
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteMoviesBloc, RemoteMoviesState>(
      builder: (_, state) {
        if (state is RemoteMoviesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteMoviesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteMoviesDone) {
          return _isSearching
              ? _buildSuggestionsList(state.movies!.results!)
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return MovieWidget(
                      movies: state.movies!.results![index],
                      onMoviePressed: (movie) =>
                          _onMoviePressed(context, movie),
                    );
                  },
                  itemCount: state.movies!.results?.length,
                  physics: const BouncingScrollPhysics(),
                );
        }
        return const SizedBox();
      },
    );
  }

  void _onMoviePressed(BuildContext context, MoviesListEntity movie) {
    Navigator.pushNamed(context, '/MovieDetails', arguments: movie);
  }

  void _onShowSavedMoviesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedMovies');
  }
}
