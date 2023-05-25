import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';

import 'sub_home/accueille_sub/tabbar.dart';

class Accueille extends StatefulWidget {

  const Accueille({ Key? key }) : super(key: key);

  @override
  State<Accueille> createState() => _AccueilleState();
}

class _AccueilleState extends State<Accueille> {

   @override
   Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
       return Scaffold(
        
          
           body: SingleChildScrollView(
            child: Column(
            children: [
              //appBar
              Container(
                width: phoneWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.menu_rounded)),
                    Container(
                      margin: EdgeInsets.only(top: phoneHeight*0.04, bottom: phoneHeight*0.02),
                      width:phoneWidth*0.2,
                      height: phoneHeight*0.09,
                      decoration:const BoxDecoration(
                        image: DecorationImage(image: AssetImage('image/market.jpeg',))
                      ),
                    )
                  ],
                ),
              ),

            //pub
            Container(
              margin: EdgeInsets.only( bottom: phoneHeight*0.02),
              width: phoneWidth,
              height: phoneHeight*0.3,
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage('image/market.jpeg',),
                fit: BoxFit.fill
                )
              ),
              child:const Center(
                child: Text('Decouvre nos nouveau produit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.birthday
                ),
                ),
              ),
            ),
            Container(
              height: phoneHeight,
              child:const Tabbar() ,
            )
            
            
            
            ],
           ),
           )
       );
  }
}