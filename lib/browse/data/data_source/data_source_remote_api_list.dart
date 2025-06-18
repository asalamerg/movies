

import 'package:app_movies/browse/data/model/ListResponse.dart';

abstract class DataSourceRemoteApiList {

  Future<ListResponse> getList();
}