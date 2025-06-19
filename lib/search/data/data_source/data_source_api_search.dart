
import 'package:app_movies/search/data/model/SearchResponse.dart';

abstract class DataSourceApiSearch  {

  Future<SearchResponse> getListSearch(String query );
}