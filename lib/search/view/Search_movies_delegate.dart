

import 'package:flutter/material.dart';

class SearchMovies extends SearchDelegate{
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 18),
      ),
      scaffoldBackgroundColor: Colors.black, // الخلفية السوداء
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
   return [

   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
 return IconButton(onPressed: (){

   close(context, null);
 }, icon: const Icon(Icons.arrow_back) );
  }


  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}