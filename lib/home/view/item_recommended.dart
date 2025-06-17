import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ItemRecommended extends StatefulWidget {
  final Results results;


  const ItemRecommended({ super.key, required this.results,});

  @override
  State<ItemRecommended> createState() => _ItemRecommendedState();
}

class _ItemRecommendedState extends State<ItemRecommended> {
  @override
   bool  _isCheck=false;

  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 220,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl:  buildImageUrl(widget.results.posterPath),
              fit: BoxFit.cover,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ___) =>ErrorWidget(" Error NO Image ") ,
            ),
          ),
          IconButton(onPressed: () {
            setState(() {
              _isCheck = !_isCheck;
            });
          },
            icon: Image.asset(
              _isCheck  ? "assets/image/bookmark.png"  : "assets/image/Icon awesome-bookmark.png",
              width: 27.w,
              height: 36.h,
            ),
          ),



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


