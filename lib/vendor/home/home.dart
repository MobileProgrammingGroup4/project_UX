import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


   @override
   Widget build(BuildContext context) {

    List<Map> product = [
      {
        "name": "Carrot",
        "category":"Vegetable",
        "Price": 29,
        "quantity":"3",
        "avatar": "image/market.jpeg"
      },
      {
        "name": "Tomato",
        "category":"Vegetable",
        "price": 22,
        "quantity":"3",
        "avatar": "image/market.jpeg"
      },
      {
        "name": "Red peper",
        "category":"Vegetable",
        "price": 26,
        "quantity":"3",
        "avatar": "image/market.jpeg"
      },
      {
        "name": "Green peper",
        "category":"Vegetable",
        "price": 22,
        "quantity":"3",
        "avatar": "image/market.jpeg"
      },
    ];

    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: SingleChildScrollView(
            child: Container(
              height: phoneHeight,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: Column(
                children: [
                  GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 25.0,
                crossAxisSpacing: 25.0,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return index == product.length - 1
                    ? Container(
                        // height: 200,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(product[index]['avatar']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+" + product.length.toString(),
                                style: TextStyle(
                                    color: Color(0xffFEDD1F),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 60),
                              ),
                              Text(
                                "more",
                                style: TextStyle(
                                    color: Color(0xffFEDD1F),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.bottomLeft,
                        // height: 200,
                        // width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: phoneHeight * 0.02,
                            horizontal: phoneWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(product[index]['avatar']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          product[index]['name'] +
                              ", " +
                              product[index]['price'].toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      );
              },
            ),
                ],
              ),
            ),
           ),
       );
  }
}