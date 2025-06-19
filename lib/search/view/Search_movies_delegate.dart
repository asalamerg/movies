import 'package:app_movies/search/view/item_search.dart';
import 'package:app_movies/search/view_model/cubit_search.dart';
import 'package:app_movies/search/view_model/state_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovies extends SearchDelegate {
  final CubitSearch viewModel;

  SearchMovies({required this.viewModel});

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
      scaffoldBackgroundColor: Colors.black,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    viewModel.getMoviesSearch(query);

    return BlocBuilder<CubitSearch, StateSearch>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingSearch) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessSearch) {
          if (state.results.isEmpty) {
            return const Center(child: Text("لا توجد نتائج", style: TextStyle(color: Colors.white)));
          }
          return ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final movie = state.results[index];
              return ItemSearch(results: movie); // ✅ هذا هو المطلوب
            },
          );
        } else if (state is ErrorSearch) {
          return Center(
              child: Text("حدث خطأ: ${state.message}", style: const TextStyle(color: Colors.white)));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text("ابدأ بالكتابة للبحث", style: TextStyle(color: Colors.white)));
    }
    return buildResults(context);
  }
}
