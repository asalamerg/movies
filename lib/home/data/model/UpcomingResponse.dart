import 'Results.dart';
import 'dart:convert';

UpcomingResponse upcomingResponseFromJson(String str) => UpcomingResponse.fromJson(json.decode(str));
class UpcomingResponse {
  UpcomingResponse({
      this.page,
      this.results, 
      this.totalPages, 
      this.totalResults,});

  UpcomingResponse.fromJson(dynamic json) {
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