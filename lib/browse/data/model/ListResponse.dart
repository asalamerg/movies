import 'Genres.dart';
import 'dart:convert';

ListResponse listResponseFromJson(String str) => ListResponse.fromJson(json.decode(str));

class ListResponse {
  ListResponse({
      this.genres,});

  ListResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;



}