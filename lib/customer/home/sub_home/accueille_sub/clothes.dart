import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/Clothes/chaussure.dart';

import '../Clothes/vetements.dart';

class Clothes extends StatefulWidget {

  const Clothes({ Key? key }) : super(key: key);

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {

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

                //tuber
                /*const Padding(padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                ),*/
              ],
            ),
           ),
       );
  }
}