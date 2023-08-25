import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:updated_tmdb_app/features/all_movies/presentation/bloc/movies/remote/remote_movie_event.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/all_movies/presentation/bloc/movies/remote/remote_movie_bloc.dart';
import 'features/all_movies/presentation/pages/home/home_page.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteMoviesBloc>(
      create: (context) => sl()..add(const GetMovies()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const HomePage()
      ),
    );
  }
}

