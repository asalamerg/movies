import 'dart:convert';

import 'package:app_movies/home/data/model/Results.dart';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));
class SearchResponse {
  SearchResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  SearchResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  List<Results>? results;
  num? totalPages;
  num? totalResults;



}