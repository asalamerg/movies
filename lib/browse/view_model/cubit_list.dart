
import 'package:app_movies/browse/data/repository/list_repository.dart';
import 'package:app_movies/browse/view_model/statue_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitList extends Cubit<StatueList>{
  CubitList() :super(listInitialState());
  final listRepository =ListRepository();
  Future<void> getListViewModel()async{
    emit(listLoading());

    try{
     final response= await  listRepository.getListRepo();
      emit(listSuccess(response));
    }catch(e){
      emit(listError(e.toString()));
    }
  }
}