import 'package:app_movies/watch/view_model/watch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_movies/home/data/model/Results.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final List<Results> _favorites = [];

  void toggleFavorite(Results movie) {
    final isExist = _favorites.any((element) => element.id == movie.id);

    if (isExist) {
      _favorites.removeWhere((element) => element.id == movie.id);
    } else {
      _favorites.add(movie);
    }

    emit(FavoriteUpdated(List.from(_favorites)));
  }

  bool isFavorite(Results movie) {
    return _favorites.any((element) => element.id == movie.id);
  }

  List<Results> get favorites => List.unmodifiable(_favorites);
}

