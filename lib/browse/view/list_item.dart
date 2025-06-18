
import 'package:app_movies/browse/data/model/Genres.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget{
  Genres genres ;
  ListItem(this.genres);
  @override
  Widget build(BuildContext context) {
     return Container(
         height: 90,
         width:158 ,
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("assets/image/illustration.png"))
       ),
       child: Center(child: Text(genres.name ?? " genres ",style: TextStyle(color: Colors.white),),),

     );
  }
}