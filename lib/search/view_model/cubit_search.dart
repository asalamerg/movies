
import 'package:app_movies/search/data/repository/repository_search.dart';
import 'package:app_movies/search/view_model/state_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitSearch extends Cubit<StateSearch>{
  CubitSearch() : super(InitialStateSearch());

  final _repositorySearch =RepositorySearch();
   final searchController =TextEditingController();

  Future<void> getMoviesSearch(String query) async{
    emit(LoadingSearch());
    try{
     final response  =await  _repositorySearch.getMoviesRepo(  query);
     emit(SuccessSearch(response));
    }catch(e){
      emit(ErrorSearch(e.toString()));

    }

  }

}