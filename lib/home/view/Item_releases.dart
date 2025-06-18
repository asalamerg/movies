import 'package:app_movies/details/view/details_screen.dart';
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
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsScreen.routeName , arguments: widget.results,);
      },
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: buildImageUrl(widget.results.posterPath),
                fit: BoxFit.cover,
                placeholder: (_, __) => const LoadingIndicator(),
                errorWidget: (_, __, ___) => ErrorWidget("Error NO Image "),
              ),
            ),
          ),
          // Text(
          //   widget.results.title ?? "",
          //   style: const TextStyle(color: Colors.white, fontSize: 14),
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),



        ],
      ),
    );
  }
  String buildImageUrl(String? posterPath, {String size = "w500"}) {
    if (posterPath == null || posterPath.isEmpty) {
      return ""; // لإجبار CachedNetworkImage على إظهار errorWidget
    }
    return "https://image.tmdb.org/t/p/$size$posterPath";
  }
}

