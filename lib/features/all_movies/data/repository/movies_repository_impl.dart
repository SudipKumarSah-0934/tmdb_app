import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/movies_list.dart';
import '../../domain/repository/movies_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/movies_api_service.dart';
import '../models/movies_list_model.dart';
import '../models/movies_model.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiService _moviesApiService;
  final AppDatabase _appDatabase;
  MoviesRepositoryImpl(this._moviesApiService,this._appDatabase);
  
  @override
  Future<DataState<MoviesModel>> getNowPlayingMoviesList() async {

   try {
    final httpResponse = await _moviesApiService.getNowPlayingMoviesList(
      apiKey:moviesAPIKey,
      language:moviesLanguage,
      page:moviesPage,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions
        )
      );
    }
   } on DioException catch(e){
    return DataFailed(e);
   }
  }

  @override
  Future<List<MoviesListModel>> getSavedMovies() async {
    return _appDatabase.moviesDAO.getMoviesList();
  }

  @override
  Future<void> removeMovie(MoviesListEntity movie) {
    return _appDatabase.moviesDAO.deleteMoviesList(MoviesListModel.fromEntity(movie));
  }

  @override
  Future<void> saveMovie(MoviesListEntity movie) {
    return _appDatabase.moviesDAO.insertMoviesList(MoviesListModel.fromEntity(movie));
  }

  
}