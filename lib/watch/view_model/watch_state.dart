import 'package:app_movies/home/data/model/Results.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List<Results> favorites;

  FavoriteUpdated(this.favorites);
}