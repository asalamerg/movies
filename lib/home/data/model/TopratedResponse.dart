import 'Results.dart';
import 'dart:convert';

TopratedResponse topratedResponseFromJson(String str) => TopratedResponse.fromJson(json.decode(str));
class TopratedResponse {
  TopratedResponse({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  TopratedResponse.fromJson(dynamic json) {
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