
import 'package:app_movies/search/data/data_source/data_source_api_search.dart';
import 'package:app_movies/search/data/model/SearchResponse.dart';
import 'package:app_movies/shared/api_constant.dart';
import 'package:dio/dio.dart';

class DataSourceApiSearchImpl  extends DataSourceApiSearch {
  final _dio=Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<SearchResponse> getListSearch(String query) async{
    try{
   final response =await _dio.get("/search/movie",
         queryParameters: {
         "api_key" : ApiConstant.apiKey ,
           "query" :  query ,
          } );
    return SearchResponse.fromJson(response.data);
  }catch(e){
      String ? message ;
      if(e is DioException){message=e.response?.data[""];}
      return throw Exception(message ?? " error get list search data source");
    }
  }

}