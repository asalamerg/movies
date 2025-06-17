import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemPopular extends StatelessWidget {
  final Results results;

  const ItemPopular({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return

      CachedNetworkImage(
        imageUrl: buildImageUrl(results.posterPath),
        height: 289,
        width: 412,
        fit: BoxFit.fill,
        placeholder: (_, __) => const LoadingIndicator(),
        errorWidget: (_, __, ___) => const Center(child: Text("error")),
      );
  }


}


String buildImageUrl(String? posterPath, {String size = "w500"}) {
  if (posterPath == null || posterPath.isEmpty) {
    return "assets/image/no-image.png"; // لإجبار CachedNetworkImage على إظهار errorWidget
  }
  return "https://image.tmdb.org/t/p/$size$posterPath";
}


