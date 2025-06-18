import 'dart:convert';

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));
class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;


}