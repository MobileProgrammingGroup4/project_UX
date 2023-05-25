import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/farm_product/vegetable.dart';

import '../Clothes/chaussure.dart';
import '../Clothes/vetements.dart';
import '../farm_product/fruit.dart';
import '../farm_product/tuber.dart';

class TopProduc extends StatefulWidget {

  const TopProduc({ Key? key }) : super(key: key);

  @override
  State<TopProduc> createState() => _TopProducState();
}

class _TopProducState extends State<TopProduc> {

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
                //clothe
                const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("Clothe",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                ),
                ),
                Container(
                  height: phoneHeight*0.4,
                  width: phoneWidth,
                  child:Vetements() ,
                ),

                //shoe
                const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text("Shoe",
                style: TextStyle(
                  fontSize: 20,
                  
                ),
                ),
                ),
                Container(
                  height: phoneHeight*0.4,
                  width: phoneWidth,
                  child:Chaussure() ,
                ),

              ],
            ),
           ),
       );
  }
}