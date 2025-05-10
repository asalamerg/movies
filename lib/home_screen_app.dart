
import 'package:app_movies/browse/browse.dart';
import 'package:app_movies/search/search.dart' show Search;
import 'package:app_movies/shared/theme_app.dart';
import 'package:app_movies/watch/watch.dart' show Watch;
import 'package:flutter/material.dart';

import 'home/home.dart' show Home;

class HomeScreen extends StatefulWidget{
 static const  String routeName="homeScreen";

   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectItem=0;
  List<Widget>select=[
    const Home(),
    Search(),
    Browse(),
    Watch(),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(bottomNavigationBar : BottomNavigationBar(
              type:BottomNavigationBarType.shifting ,
                  selectedItemColor: ThemeApp.selectCategory,
                 unselectedItemColor: ThemeApp.unselectedCategory ,
            currentIndex:  selectItem,
             iconSize: 40,

            onTap: (v){
                selectItem=v;
                setState(() {
                });},
            items: const [

         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home" , backgroundColor: ThemeApp.backgroundColorBottomNavigationBarItem,),
         BottomNavigationBarItem(icon: Icon(Icons.search), label: "search", backgroundColor: ThemeApp.backgroundColorBottomNavigationBarItem,),
         BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/image/browse.png")), label: "browse", backgroundColor: ThemeApp.backgroundColorBottomNavigationBarItem,),
         BottomNavigationBarItem(icon:ImageIcon(AssetImage("assets/image/watch.png")), label: "watch", backgroundColor: ThemeApp.backgroundColorBottomNavigationBarItem,),
        ]),
      body: select[selectItem],

      );

  }
}