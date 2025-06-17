
import 'package:app_movies/home/data/model/Results.dart';

abstract class MoviesState {}

class MoviesInitialState  extends MoviesState{}

class MoviesLoadingTopRated extends MoviesState{}
class MoviesErrorTopRated extends MoviesState{String message; MoviesErrorTopRated(this.message);}
class MoviesSuccessTopRated extends MoviesState{
  final List<Results> movies;
  MoviesSuccessTopRated(this.movies);

}


class MoviesLoadingPopular extends MoviesState{}
class MoviesErrorPopular extends MoviesState{String message; MoviesErrorPopular(this.message);}
class MoviesSuccessPopular extends MoviesState{
  final List<Results> movies;
  MoviesSuccessPopular(this.movies);
}



class MoviesLoadingUpcoming extends MoviesState{}
class MoviesErrorUpcoming extends MoviesState{String message; MoviesErrorUpcoming(this.message);}
class MoviesSuccessUpcoming extends MoviesState{
  final List<Results> movies;
  MoviesSuccessUpcoming(this.movies);
}
