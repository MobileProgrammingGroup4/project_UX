import 'package:flutter/material.dart';
import 'package:lookam/customer/select_product.dart';

List<Map> shoe = [
  {
    "name": "Air force 1",
    "index":0,
    "category": "shoe",
    "price": 10200,
    //
    "vendor": "Frank",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "Air force 1",
    "index":1,
    "category": "shoe",
    "price": 225,
    "vendor": "tourtue noir",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "Landalouse",
    "index":2,
    "category": "shoe",
    "price": 26000,
    "vendor": "sakaki",
    "avatar": "image/talon.jpeg"
  },
  {
    "name": "Pantoufle",
    "index":3,
    "category": "shoe",
    "price": 2200,
    "vendor": "susaku",
    "avatar": "image/baboucheF.jpeg"
  },
  {
    "name": "Yellow peper",
    "index":4,
    "category": "shoe",
    "price": 22,
    "vendor": "JOJO",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "Blue peper",
    "index":5,
    "category": "shoe",
    "price": 22,
    "vendor": "Guts",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "Pink peper",
    "category": "shoe",
    "price": 22,
    "vendor": "Pinky",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "orange peper",
    "index":6,
    "category": "shoe",
    "price": 22,
    "vendor": "Darel",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "black peper",
    "index":7,
    "category": "shoe",
    "price": 22,
    "vendor": "michelle",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "glod peper",
    "index":8,
    "category": "shoe",
    "price": 22,
    "vendor": "yuiji",
    "avatar": "image/chaussureH.jpg"
  },
  {
    "name": "Pink peper",
    "index":9,
    "category": "shoe",
    "price": 22,
    "vendor": "fujihara",
    "avatar": "image/chaussureH.jpg"
  },
];

class Product {
  String name;
  var imageUrl;
  String price;
  String description;
  String vendorname;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.vendorname,
  });
}

class Chaussure extends StatefulWidget {
  const Chaussure({Key? key}) : super(key: key);

  @override
  State<Chaussure> createState() => _ChaussureState();
}

class _ChaussureState extends State<Chaussure> {
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
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        /*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                ),*/
        itemCount: counter(hasBeenTapped, shoe.length),
        itemBuilder: (BuildContext context, int index) {
          return index == indet(hasBeenTapped, shoe.length)
              ? GestureDetector(
                  onTap: () {
                    print('have been tapped');
                    
                    setState(() {
                      hasBeenTapped = true;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: phoneHeight * 0.5,
                    width: phoneWidth * 0.6,
                    // height: 200,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(shoe[index]['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "+" + rest(shoe.length).toString(),
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
                    /*String selected = shoe[index]['name']['category']
                                ['price']['quantity']['avatar'].toString();

                    // print(selected);*/
                    Navigator.pushNamed(
      context,
      '/select_product',
      arguments: Product(
        name: shoe[index]['name'],
    imageUrl: shoe[index]['avatar'],
    price: shoe[index]['price'].toString(),
    description: shoe[index]['category'],
    vendorname: shoe[index]['vendor'],
      ),
    );

     /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectProduct(product: shoe[index])),
              );*/
                    print(shoe[index]['name']);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    height: phoneHeight * 0.5,
                    width: phoneWidth * 0.6,
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
                        image: AssetImage(shoe[index]['avatar']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      shoe[index]['name'] +
                          ", " +
                          shoe[index]['price'].toString(),
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


