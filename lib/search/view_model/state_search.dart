
import 'package:app_movies/home/data/model/Results.dart';

abstract class StateSearch {}

 class InitialStateSearch extends StateSearch{}
class  LoadingSearch extends StateSearch{}
class ErrorSearch extends StateSearch{
  String message ;
  ErrorSearch(this.message);
}
class SuccessSearch extends StateSearch{
  List<Results> results ;
  SuccessSearch(this.results);
}