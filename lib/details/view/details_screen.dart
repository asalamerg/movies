//
// import 'package:app_movies/home/data/model/Results.dart';
// import 'package:app_movies/home/model_view/movies_cubit.dart';
// import 'package:app_movies/home/model_view/movies_statues.dart';
// import 'package:app_movies/home/view/item_recommended.dart';
// import 'package:app_movies/shared/loading_indicator.dart';
// import 'package:app_movies/shared/theme_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class DetailsScreen extends StatefulWidget{
//  static const   String routeName="DetailsScreen";
//
//   const DetailsScreen({super.key});
//
//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }
//
// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//    final results =ModalRoute.of(context)!.settings.arguments as Results;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ThemeApp.blackScreen ,
//         leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back ,)),
//         title: const Text("Dora and the lost city of gold"),centerTitle: true, foregroundColor: Colors.white,),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//           Image.asset("assets/image/details.png" ,
//             height:217 ,width: double.infinity, fit: BoxFit.fill,) ,
//             const SizedBox(height: 13,),
//            const Text("Dora and the lost city of gold" ,style: TextStyle(color: Colors.white ,fontSize: 18),) ,
//             const SizedBox(height: 8,),
//             const Text("2019  PG-13  2h 7m",style: TextStyle(color: Colors.white ,fontSize: 10)),
//             const SizedBox(height: 8,),
//             Row(children: [
//               Column(children: [
//                 Image.asset("assets/image/details.png" ,
//                   height:199 ,width: 129, fit: BoxFit.fill, )],),
//
//               Padding(
//                 padding: const EdgeInsets.all(11),
//                 child: Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                    const Row(
//
//                      children: [
//                      Text("Action",style: TextStyle(color: Colors.white ,fontSize: 10)) ,
//                        SizedBox(width: 13,),
//                      Text("Action",style: TextStyle(color: Colors.white ,fontSize: 10)) ,
//                        SizedBox(width: 13,),
//                      Text("Action",style: TextStyle(color: Colors.white ,fontSize: 10)) ,
//                    ],),
//                     const SizedBox(height: 13,),
//                     const Text("Having spent most of her life exploring the jungle, nothing could prepare . " ,style: TextStyle(color: Colors.white ,fontSize: 13)) ,
//                     const Text("exploring the jungle, nothing could  " ,style: TextStyle(color: Colors.white ,fontSize: 13)) ,
//                       const Text(" prepare Dora for her most dangerous " ,style: TextStyle(color: Colors.white ,fontSize: 13)) ,
//                       const Text(" adventure yet — high school. " ,style: TextStyle(color: Colors.white ,fontSize: 13)) ,
//                     const SizedBox(height: 13,),
//                      const Text("7.7",style: TextStyle(color: Colors.white ,fontSize: 20) ),
//
//                       ColoredBox(
//                         color: ThemeApp.backgroundList,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text("Recommended", style: TextStyle(color: Colors.white, fontSize: 20),),
//
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.25,
//                               child: BlocBuilder<MoviesCubit, MoviesState>(
//                                 builder: (context, state) {
//                                   if (state is MoviesLoadingTopRated) {
//                                     return const LoadingIndicator();}
//                                   else if (state is MoviesErrorTopRated) {
//                                     return ErrorWidget(state.message);
//                                   } else if (state is MoviesSuccessTopRated) {
//                                     return ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: state.movies.length,
//                                       physics: const BouncingScrollPhysics(),
//                                       itemBuilder: (context, index) {
//                                         return ItemRecommended(results: state.movies[index],
//                                         );
//                                       },
//                                     );
//                                   }
//                                   return const SizedBox();
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],),
//                 ),
//               )
//             ],),
//
//         ],),
//       ),
//     );
//   }
// }

import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/home/model_view/movies_cubit.dart';
import 'package:app_movies/home/model_view/movies_statues.dart';
import 'package:app_movies/home/view/item_recommended.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:app_movies/shared/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final results = ModalRoute.of(context)!.settings.arguments as Results;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.blackScreen,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(results.title ?? "Movie Title"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الغلاف الرئيسية
            results.backdropPath != null
                ? Image.network(
              "https://image.tmdb.org/t/p/w500${results.backdropPath}",
              height: 217,
              width: double.infinity,
              fit: BoxFit.fill,
            )
                : const SizedBox(height: 217),

            const SizedBox(height: 13),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                results.title ?? "No Title",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${results.releaseDate ?? "Unknown Date"}  |  PG-13  |  2h 7m",
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),

            const SizedBox(height: 8),

            // قسم الصورة + التفاصيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة الفيلم
                  results.posterPath != null
                      ? Image.network(
                    "https://image.tmdb.org/t/p/w500${results.posterPath}",
                    height: 199,
                    width: 129,
                    fit: BoxFit.fill,
                  )
                      : const SizedBox(width: 129, height: 199),

                  const SizedBox(width: 10),

                  // التفاصيل النصية
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("Action",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                              SizedBox(width: 13),
                              Text("Adventure",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                              SizedBox(width: 13),
                              Text("Family",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ],
                          ),
                          const SizedBox(height: 13),
                          Text(
                            results.overview ?? "No description available.",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
                          ),
                          const SizedBox(height: 13),
                          Text(
                            "⭐ ${results.voteAverage?.toStringAsFixed(1) ?? "0.0"}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // قائمة الأفلام المقترحة
            ColoredBox(
              color: ThemeApp.backgroundList,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recommended",
                        style: TextStyle(color: Colors.white, fontSize: 20)),

                    const SizedBox(height: 8),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: BlocBuilder<MoviesCubit, MoviesState>(
                        builder: (context, state) {
                          if (state is MoviesLoadingTopRated) {
                            return const LoadingIndicator();
                          } else if (state is MoviesErrorTopRated) {
                            return ErrorWidget(state.message);
                          } else if (state is MoviesSuccessTopRated) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movies.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ItemRecommended(
                                    results: state.movies[index],
                                  ),
                                );
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
