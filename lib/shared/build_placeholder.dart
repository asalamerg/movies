
import 'package:app_movies/shared/theme_app.dart';
import 'package:flutter/material.dart';

class BuildPlaceholder extends StatelessWidget{
  const BuildPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(
      color: ThemeApp.backgroundColorBottomNavigationBarItem,
    ),);
  }
}