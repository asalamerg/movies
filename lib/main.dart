import 'package:app_movies/browse/view_model/cubit_list.dart';
import 'package:app_movies/home/model_view/movies_cubit.dart';
import 'package:app_movies/search/view_model/cubit_search.dart';
import 'package:app_movies/shared/observer.dart';
import 'package:app_movies/shared/theme_app.dart';
import 'package:app_movies/watch/view_model/watch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'details/view/details_screen.dart';
import 'home_screen_app.dart' show HomeScreen;

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MoviesCubit()),
        BlocProvider(create: (_)=>CubitList()),
        BlocProvider(create: (_)=>CubitSearch()),
        BlocProvider(create: (_)=>FavoriteCubit())
      ],
      child: const Movies(),
    ),
  );
}



class Movies extends StatelessWidget{
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(412, 892),
      minTextAdapt: true,
      child: MaterialApp(
        routes: {
          HomeScreen.routeName :(_)=> const HomeScreen(),
          DetailsScreen.routeName :(_)=>const DetailsScreen(),
          

        },initialRoute: HomeScreen.routeName,

          theme: ThemeApp.lightTheme,
        themeMode: ThemeMode.light
      ),
    );

  }
}