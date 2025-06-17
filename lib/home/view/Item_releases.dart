import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ItemReleases extends StatefulWidget {
  Results results;


   ItemReleases({
    super.key,  required this.results,

  });

  @override
  State<ItemReleases> createState() => _ItemReleasesState();
}

class _ItemReleasesState extends State<ItemReleases> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: (widget.results.posterPath?? "https://www.freeiconspng.com/images/no-image-icon"),
              fit: BoxFit.cover,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ___) => ErrorWidget("Error NO Image "),
            ),
          ),
        ),
        Text(
          widget.results.title ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          widget.results.title ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          widget.results.overview ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    );
  }
}

