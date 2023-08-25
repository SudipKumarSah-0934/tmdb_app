import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/all_movies/data/data_sources/local/app_database.dart';
import 'features/all_movies/data/data_sources/remote/movies_api_service.dart';
import 'features/all_movies/data/repository/movies_repository_impl.dart';
import 'features/all_movies/domain/repository/movies_repository.dart';
import 'features/all_movies/domain/usecases/get_movies.dart';
import 'features/all_movies/domain/usecases/get_saved_movies.dart';
import 'features/all_movies/domain/usecases/remove_movies.dart';
import 'features/all_movies/domain/usecases/save_movies.dart';
import 'features/all_movies/presentation/bloc/movies/local/local_movie_bloc.dart';
import 'features/all_movies/presentation/bloc/movies/remote/remote_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<MoviesApiService>(MoviesApiService(sl()));

  sl.registerSingleton<MoviesRepository>(
    MoviesRepositoryImpl(sl(),sl())
  );
  
  //UseCases
  sl.registerSingleton<GetMoviesUseCase>(
    GetMoviesUseCase(sl())
  );

  sl.registerSingleton<GetSavedMoviesUseCase>(
    GetSavedMoviesUseCase(sl())
  );

  sl.registerSingleton<SaveMovieUseCase>(
    SaveMovieUseCase(sl())
  );
  
  sl.registerSingleton<RemoveMovieUseCase>(
    RemoveMovieUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteMoviesBloc>(
    ()=> RemoteMoviesBloc(sl())
  );

  sl.registerFactory<LocalMovieBloc>(
    ()=> LocalMovieBloc(sl(),sl(),sl())
  );


}