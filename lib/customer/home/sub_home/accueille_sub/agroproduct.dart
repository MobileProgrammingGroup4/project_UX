import 'package:flutter/material.dart';

import '../farm_product/fruit.dart';
import '../farm_product/tuber.dart';
import '../farm_product/vegetable.dart';

class Agroproduct extends StatefulWidget {

  const Agroproduct({ Key? key }) : super(key: key);

  @override
  State<Agroproduct> createState() => _AgroproductState();
}

class _AgroproductState extends State<Agroproduct> {

   @override
   Widget build(BuildContext context) {
      var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;

       return Scaffold(
           
           body: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //vegetable
                const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("Farm product",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                ),
                ),
                Container(
                  height: phoneHeight*0.4,
                  width: phoneWidth,
                  child:Vegetable() ,
                ),

                //fruit
                const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("Fruit",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                ),
                ),
                Container(
                  height: phoneHeight*0.4,
                  width: phoneWidth,
                  child:Fruit() ,
                ),

                //tuber
                const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("Tuber",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                ),
                ),
                Container(
                  height: phoneHeight*0.4,
                  width: phoneWidth,
                  child:Tuber() ,
                ),
              ],
            ),
           ),
       );
  }
}