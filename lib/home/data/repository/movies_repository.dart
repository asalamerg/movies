
import 'package:app_movies/home/data/data_sources/remote/data_source_remote_api_impl.dart';
import 'package:app_movies/home/data/model/Results.dart';
import 'package:flutter/cupertino.dart';

class MoviesRepository {

  final _dataSourceRemoteApiImpl =DataSourceRemoteApiImpl();

  Future<List<Results>?> getPopularRepo()async{
    try {

      final repo = await _dataSourceRemoteApiImpl.getPopular();
      return repo.results ;
    }catch(e){
      debugPrint('Repository error: $e');
       throw Exception(" error getPopularRepo ");
    }
  }


  Future<List<Results>?> getTopRatedRepo()async{
    try {
    final repo = await _dataSourceRemoteApiImpl.getTopRated();
    return  repo.results;
    }catch(e){
      debugPrint('Repository error: $e');
    throw Exception(" error getTopRatedRepo ");
    }
  }


  Future<List<Results>?> getUpcomingRepo()async{
    try {
    final repo = await _dataSourceRemoteApiImpl.getUpcoming();
    return  repo.results ;
  }catch(e){
      debugPrint('Repository error: $e');
      throw Exception(" error getUpcomingRepo ");

    }
    }



}