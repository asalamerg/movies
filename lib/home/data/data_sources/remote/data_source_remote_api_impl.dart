
import 'package:app_movies/home/data/data_sources/remote/data_source_remote_api.dart';
import 'package:app_movies/home/data/model/PopularResponse.dart';
import 'package:app_movies/home/data/model/TopratedResponse.dart';
import 'package:app_movies/home/data/model/UpcomingResponse.dart';
import 'package:app_movies/shared/api_constant.dart';
import 'package:dio/dio.dart';





class DataSourceRemoteApiImpl implements DataSourceRemoteApi{


    final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    headers: {
      'Authorization': 'Bearer ${ApiConstant.tokenKey}',
      'accept': 'application/json',
    },

  ));

  @override
  Future<PopularResponse> getPopular() async{
    try {
      final response = await _dio.get(
          ApiConstant.endPointPopular, queryParameters: {
        "api_key": ApiConstant.apiKey,
        "language": 'en-US',
        "page": 1,

      });
      return PopularResponse.fromJson(response.data );
    } catch(e){
      String? message;

      if(e is DioException){message =e.response?.data["status_message"];}


      return throw Exception(message ?? " error get Popular data Source ");
    }
  }

  @override
  Future<TopratedResponse> getTopRated()async {
    try {
      final response = await _dio.get(
          ApiConstant.endPointTopRated, queryParameters: {
        "api_key": ApiConstant.apiKey,
        "language": 'en-US',
        "page": 1,

      });
      return TopratedResponse.fromJson(response.data);
    } catch(e){
      String? message;
      if(e is DioException){message =e.response?.data["status_message"];


      }

      return throw Exception(message ?? " error get TopRated data Source ");
    }
  }

  @override
  Future<UpcomingResponse> getUpcoming() async{
    try {
      final response = await _dio.get(
          ApiConstant.endPointUpcoming, queryParameters: {
        "api_key": ApiConstant.apiKey,
        "language": 'en-US',
        "page": 1,

      });
      return UpcomingResponse.fromJson(response.data);
    } catch(e){


      String? message;
      if(e is DioException){message =e.response?.data["status_message"];
      }
      return throw Exception(message ?? " error get Upcoming data Source ");

    }
  }

}

