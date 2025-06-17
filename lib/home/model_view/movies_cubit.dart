
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/movies_repository.dart';
import 'movies_statues.dart';

class MoviesCubit extends Cubit<MoviesState>{
  MoviesCubit() :super(MoviesInitialState());

  final _moviesRepository =MoviesRepository();

  Future<void> fetchInitialData() async {
    await Future.wait([
      getPopularVM(),
      getTopRatedVM(),
      getUpcomingVM(),
    ]);
  }

  Future<void> getPopularVM()async{
    emit(MoviesLoadingPopular());
    try{
      final results =    await _moviesRepository.getPopularRepo();
       emit(MoviesSuccessPopular(results ??[]));

    }catch(e){
      emit(MoviesErrorPopular(e.toString()));
      debugPrint('Popular movies error: $e');
    }
  }

  Future<void> getTopRatedVM()async{
    emit(MoviesLoadingTopRated());
    try{
      final results = await _moviesRepository.getTopRatedRepo();
      emit(MoviesSuccessTopRated(results ??[]));

    }catch(e){
      emit(MoviesErrorTopRated(e.toString()));
      debugPrint('Popular movies error: $e');
    }
  }


  Future<void> getUpcomingVM()async{
    emit(MoviesLoadingUpcoming());
    try{
      final results =  await _moviesRepository.getUpcomingRepo();
      emit(MoviesSuccessUpcoming(results ??[]));

    }catch(e){
      emit(MoviesErrorUpcoming(e.toString()));
      debugPrint('Popular movies error: $e');
    }
  }


}