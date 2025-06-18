
import 'package:app_movies/browse/data/data_source/data_source_remote_api_list_imple.dart';
import 'package:app_movies/browse/data/model/Genres.dart';
import 'package:flutter/foundation.dart';

class ListRepository{
   final dataSourceRemoteApiListImpl =DataSourceRemoteApiListImpl();

   Future<List<Genres>> getListRepo()async{
     try {
       final response = await dataSourceRemoteApiListImpl.getList();

       return response.genres ?? [];
     }catch(e){
       debugPrint(' get list Repository error: $e');
       throw Exception(" error get list  ");
     }

   }
}