import 'package:app_movies/details/view/details_screen.dart';
import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:app_movies/watch/view_model/watch_cubit.dart';
import 'package:app_movies/watch/view_model/watch_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ItemRecommended extends StatelessWidget {
  final Results results;

  const ItemRecommended({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFav = cubit.isFavorite(results);

        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsScreen.routeName,
              arguments: results,
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: buildImageUrl(results.posterPath),
                  fit: BoxFit.cover,
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) => const Center(child: Text("No Image")),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    cubit.toggleFavorite(results);
                  },
                  child: Image.asset(
                    isFav
                        ? "assets/image/bookmark.png"
                        : "assets/image/Icon awesome-bookmark.png",
                    width: 27.w,
                    height: 36.h,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String buildImageUrl(String? posterPath, {String size = "w500"}) {
    if (posterPath == null || posterPath.isEmpty) {
      return "";
    }
    return "https://image.tmdb.org/t/p/$size$posterPath";
  }
}



