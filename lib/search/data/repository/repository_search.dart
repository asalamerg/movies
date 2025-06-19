
import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/search/data/data_source/data_source_api_searchI_imple.dart';

class RepositorySearch {

 final  _dataSourceApiSearchImpl =DataSourceApiSearchImpl();

 Future<List<Results>> getMoviesRepo(String query)async{
    try {
      final response = await _dataSourceApiSearchImpl.getListSearch(query);

      return response.results ?? [];
    }catch(e){
      return throw Exception("error  Repository Search");
    }
 }
}