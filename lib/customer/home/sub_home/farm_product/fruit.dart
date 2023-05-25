import 'package:flutter/material.dart';

class Fruit extends StatefulWidget {

  const Fruit({ Key? key }) : super(key: key);

  @override
  State<Fruit> createState() => _FruitState();
}

class _FruitState extends State<Fruit> {
bool hasBeenTapped = false;

   List<Map> fruit = [
    {
      "name": "Carrot",
      "category": "Vegetable",
      "price": 200,
      "quantity": "3",
      "vendor":"Frank",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Tomato",
      "category": "Vegetable",
      "price": 225,
      "quantity": "3",
      "vendor":"tourtue noir",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Red peper",
      "category": "Vegetable",
      "price": 26,
      "quantity": "3",
      "vendor":"sakaki",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Green peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"susaku",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Yellow peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"JOJO",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Blue peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"Guts",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"Pinky",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "orange peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"Darel",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "black peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"michelle",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "glod peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"yuiji",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "vendor":"fujihara",
      "avatar": "image/market.jpeg"
    },
  ];

  

   @override
   Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;

    int rest(int b) {
      int left = 0;
      left = b - 7;
      return left;
    }

    int counter(bool a, int c) {
      int count = 0;
      if (a == true) {
        count = c;
        return count;
      } else {
        count = 7;
        return count;
      }
    }

    int indet(bool e, int d) {
      int i = 0;
      if (e == true) {
        i = d;
        return i;
      } else {
        i = 6;
        return i;
      }
    }
       return Scaffold(
           //appBar: AppBar(title: const Text(''),),
           body: 
              ListView.builder(
                scrollDirection: Axis.horizontal,
               // physics: NeverScrollableScrollPhysics(),
               // shrinkWrap: true,
                /*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                ),*/
                itemCount: counter(hasBeenTapped, fruit.length),
                itemBuilder: (BuildContext context, int index) {
                  return index == indet(hasBeenTapped, fruit.length)
                      ? GestureDetector(
                          onTap: () {
                            print('have been tapped');
                            setState(() {
                              hasBeenTapped = true;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            height: phoneHeight*0.5,
                            width: phoneWidth*0.6,
                            // height: 200,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(fruit[index]['avatar']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+" + rest(fruit.length).toString(),
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
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            /*String selected = fruit[index]['name']['category']
                                ['price']['quantity']['avatar'].toString();*/

                            // print(selected);
                            print(fruit[index]['name']);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            height: phoneHeight*0.5,
                            width: phoneWidth*0.6,
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
                                image: AssetImage(fruit[index]['avatar']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              fruit[index]['name'] +
                                  ", " +
                                  fruit[index]['quantity'] +
                                  " for " +
                                  fruit[index]['price'].toString(),
                              //style: Theme.of(context).textTheme.headline5,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                },
              ),
            
       );
  }
}