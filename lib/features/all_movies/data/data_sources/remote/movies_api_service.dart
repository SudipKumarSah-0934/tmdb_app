import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_details_model.dart';
import '../../models/movies_model.dart';
part 'movies_api_service.g.dart';

@RestApi(baseUrl:moviesAPIBaseURL)
abstract class MoviesApiService {
  factory MoviesApiService(Dio dio) = _MoviesApiService;
  
  @GET('/now_playing')
  Future<HttpResponse<MoviesModel>> getNowPlayingMoviesList({
    @Query("api_key") String ? apiKey,
    @Query("language") String ? language,
    @Query("page") String ? page,
  });

  //TODO: Below All 3's apis will be implemented soon for full featured Apps
  @GET('/popular')
  Future<HttpResponse<MoviesModel>> getPopularMoviesList({
    @Query("api_key") String ? apiKey,
    @Query("language") String ? language,
    @Query("page") String ? page,
  });
  @GET('/top_rated')
  Future<HttpResponse<MoviesModel>> getTopRatedMoviesList({
    @Query("api_key") String ? apiKey,
    @Query("language") String ? language,
    @Query("page") String ? page,
  });
  @GET('/upcoming')
  Future<HttpResponse<MoviesModel>> getUpcomingMoviesList({
    @Query("api_key") String ? apiKey,
    @Query("language") String ? language,
    @Query("page") String ? page,
  });
  @GET('/{id}')
  Future<HttpResponse<MovieDetailsModel>> getMoviesDetails({
    @Path("id") String? id,
    @Query("api_key") String? apiKey,
    @Query("language") String? language,
  });

}