
import 'package:app_movies/browse/data/model/ListResponse.dart';
import 'package:app_movies/shared/api_constant.dart';
import 'package:dio/dio.dart';

import 'data_source_remote_api_list.dart';

class DataSourceRemoteApiListImpl extends DataSourceRemoteApiList{
  final _dio=Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3") );

  @override
  Future<ListResponse> getList()async {
  try{
 final response =await _dio.get("/genre/movie/list" ,
     queryParameters: {
     "language": "en", // يمكنك تعديل اللغة حسب رغبتك
     "api_key" : ApiConstant.apiKey ,
     });

 return ListResponse.fromJson(response.data);

  }catch(e){
    String? message ;
    if (e is DioException) {
       message =e.response?.data["status_message"];
    }
    return throw Exception(message ?? " error get list data source ");
  }
  }

}