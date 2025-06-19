import 'package:app_movies/watch/view_model/watch_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/watch_state.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favorites = context.read<FavoriteCubit>().favorites;

          if (favorites.isEmpty) {
            return const Center(child: Text("لا توجد عناصر مفضلة"));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network("https://image.tmdb.org/t/p/w92${favorites[index].posterPath}"),
                title: Text(favorites[index].title ?? 'No title'),
              );
            },
          );
        },
      ),
    );
  }
}
