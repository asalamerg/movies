
import 'package:app_movies/browse/data/model/Genres.dart';

abstract class StatueList {}

class listInitialState extends StatueList{}
class listLoading extends StatueList{}
class listError extends StatueList{
  String message ;
  listError(this.message);
}
class listSuccess extends StatueList{
  List<Genres> genres ;
  listSuccess(this.genres);
}

