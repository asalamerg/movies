import 'package:app_movies/shared/theme_app.dart';
import 'package:flutter/material.dart';

import 'home_screen_app.dart' show HomeScreen;

void main() {
  runApp( const Movies());
}

class Movies extends StatelessWidget{
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName :(_)=> HomeScreen(),
      },initialRoute: HomeScreen.routeName,

        theme: ThemeApp.lightTheme,
      themeMode: ThemeMode.light
    );

  }
}