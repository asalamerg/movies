import 'package:app_movies/home/data/model/Results.dart';
import 'package:app_movies/home/model_view/movies_cubit.dart';
import 'package:app_movies/home/model_view/movies_statues.dart';
import 'package:app_movies/shared/loading_indicator.dart';
import 'package:app_movies/shared/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'Item_releases.dart';
import 'item_popular.dart';
import 'item_recommended.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final result =Results();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<MoviesCubit>();
    cubit.getPopularVM();
    cubit.getUpcomingVM();
    cubit.getTopRatedVM();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView(
        children: [
          /// Popular Section
          SizedBox(
            height: 289,
            child: BlocBuilder<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoadingPopular) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MoviesErrorPopular) {
                  return Center(child: Text(state.message));
                } else if (state is MoviesSuccessPopular) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ItemPopular(results: state.movies[index]),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),

          /// New Releases (Upcoming)

          ColoredBox(
            color: ThemeApp.backgroundList,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("New Releases", style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: BlocBuilder<MoviesCubit, MoviesState>(
                    builder: (context, state) {
                      if (state is MoviesLoadingUpcoming) {
                        return const LoadingIndicator();
                      } else if (state is MoviesErrorUpcoming) {
                        return ErrorWidget(state.message);
                      } else if (state is MoviesSuccessUpcoming) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemReleases(results:state.movies[index],

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

          SizedBox(height: 19.h),

          /// Recommended (Top Rated)
          ColoredBox(
            color: ThemeApp.backgroundList,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Recommended", style: TextStyle(color: Colors.white, fontSize: 20),),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: BlocBuilder<MoviesCubit, MoviesState>(
                    builder: (context, state) {
                      if (state is MoviesLoadingTopRated) {
                        return const LoadingIndicator();}
                        else if (state is MoviesErrorTopRated) {
                        return ErrorWidget(state.message);
                      } else if (state is MoviesSuccessTopRated) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movies.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemRecommended(results: state.movies[index],
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


          SizedBox(height: 22.h),


        ],
      ),
      );
  }
}
