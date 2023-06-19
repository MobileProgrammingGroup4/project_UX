import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/farm_product/vegetable.dart';

List<Map> clothes = [
    {
      "name": "Air force 1",
      "category": "clothes",
      "price": 10200,
      //
      "vendor":"Frank",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Air force 1",
      "category": "clothes",
      "price": 225,
      
      "vendor":"tourtue noir",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Landalouse",
      "category": "clothes",
      "price": 26000,
      
      "vendor":"sakaki",
      "avatar": "image/talon.jpeg"
    },
    {
      "name": "Pantoufle",
      "category": "clothes",
      "price": 2200,
      
      "vendor":"susaku",
      "avatar": "image/jupe.jpeg"
    },
    {
      "name": "Yellow peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"JOJO",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Blue peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"Guts",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"Pinky",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "orange peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"Darel",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "black peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"michelle",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "glod peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"yuiji",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "clothes",
      "price": 22,
      
      "vendor":"fujihara",
      "avatar": "image/T-shirt.jpeg"
    },
    {
      "name": "Mini",
      "category": "clothes",
      "price": 2200,
      
      "vendor":"susaku",
      "avatar": "image/jupe.jpeg"
    },
    {
      "name": "Jupe",
      "category": "clothes",
      "price": 2200,
      
      "vendor":"susaku",
      "avatar": "image/jupe.jpeg"
    },
    {
      "name": "2Face",
      "category": "clothes",
      "price": 2200,
      
      "vendor":"susaku",
      "avatar": "image/jupe.jpeg"
    },
    {
      "name": "Fante",
      "category": "clothes",
      "price": 2200,
      
      "vendor":"susaku",
      "avatar": "image/jupe.jpeg"
    },
  ];

  class Habit {
  String name;
  var imageUrl;
  String price;
  String description;
  String vendorname;

  Habit({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.vendorname,
  });
}
class Vetements extends StatefulWidget {

  const Vetements({ Key? key }) : super(key: key);

  @override
  State<Vetements> createState() => _VetementsState();
}

class _VetementsState extends State<Vetements> {

   bool hasBeenTapped = false;

   

  

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
                itemCount: counter(hasBeenTapped, clothes.length),
                itemBuilder: (BuildContext context, int index) {
                  return index == indet(hasBeenTapped, clothes.length)
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
                                image: AssetImage(clothes[index]['avatar']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "+" + rest(clothes.length).toString(),
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
                            /*String selected = clothes[index]['name']['category']
                                ['price']['quantity']['avatar'].toString();*/

                            // print(selected);
                            print(clothes[index]['name']);
                            Navigator.pushNamed(
      context,
      '/select_clothes',
      arguments: Habit(
        name: clothes[index]['name'],
    imageUrl: clothes[index]['avatar'],
    price: clothes[index]['price'].toString(),
    description: clothes[index]['category'],
    vendorname: clothes[index]['vendor'],
      ),
    );
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
                                image: AssetImage(clothes[index]['avatar']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              clothes[index]['name'] +
                                  ", " +
                                  clothes[index]['price'].toString(),
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