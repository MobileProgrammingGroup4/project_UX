import 'package:flutter/material.dart';
import 'package:lookam/vendor/home/sub_home/add_product.dart';
import 'package:lookam/vendor/home/sub_home/modifier_delete.dart';
import 'package:lookam/vendor/setting/setting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hasBeenTapped = false;

  List<Map> product = [
    {
      "name": "Carrot",
      "category": "Vegetable",
      "price": 200,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Tomato",
      "category": "Vegetable",
      "price": 225,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Red peper",
      "category": "Vegetable",
      "price": 26,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Green peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Yellow peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Blue peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "orange peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "black peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "glod peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
    {
      "name": "Pink peper",
      "category": "Vegetable",
      "price": 22,
      "quantity": "3",
      "avatar": "image/market.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
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

    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 144, 187),
        toolbarHeight: 130,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          //color: Colors.amber,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                
                                Row(
                                  children: [
                                    const Icon(Icons.add),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AddProduct()));
                                        },
                                        child: const Text('Add a new product')),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.settings),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Setting()));
                                        },
                                        child: const Text('Settings'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.menu,
                size: 35,
                )),
            Container(
              width: phoneWidth * 0.3,
              height: phoneHeight * 0.09,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  image: DecorationImage(
                      image: AssetImage(
                    'image/market.jpeg',
                  ))),
            )
          ],
        ),
       const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child:  Text('DASHBOARD',
        style: TextStyle(
          fontSize: 20,
        ),
        ),
        ),

        const Padding(padding: EdgeInsets.symmetric(horizontal: 10,),
        child:  Text('lorem nknei woldkr ieeeedkdke',
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "My Store",
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: F
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                ),
                itemCount: counter(hasBeenTapped, product.length),
                itemBuilder: (BuildContext context, int index) {
                  return index == indet(hasBeenTapped, product.length)
                      ? GestureDetector(
                          onTap: () {
                            print('have been tapped');
                            setState(() {
                              hasBeenTapped = true;
                            });
                          },
                          child: Container(
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
                                    "+" + rest(product.length).toString(),
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
                            /*String selected = product[index]['name']['category']
                                ['price']['quantity']['avatar'].toString();*/

                            // print(selected);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ModifierDelete()));
                            print(product[index]['name']);
                          },
                          child: Container(
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
                                  product[index]['quantity'] +
                                  " for " +
                                  product[index]['price'].toString(),
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
            ],
          ),
        ),
      )),
    );
  }
}
