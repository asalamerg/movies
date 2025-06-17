


import 'package:app_movies/home/data/model/PopularResponse.dart';
import 'package:app_movies/home/data/model/TopratedResponse.dart';
import 'package:app_movies/home/data/model/UpcomingResponse.dart';

abstract class DataSourceRemoteApi {

  Future<PopularResponse> getPopular();
  Future<TopratedResponse> getTopRated();
  Future<UpcomingResponse> getUpcoming();

}