import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';
import 'package:lookam/vendor/auth/login.dart';
import 'package:lookam/vendor/auth/sub_loging/createAccount.dart';
import 'package:lookam/vendor/home/sub_home/sub_modefierDeleter/search.dart';

import '../../ubknwonScreen.dart';
import 'sub_home/accueille_sub/tabbar.dart';

class Accueille extends StatefulWidget {
  const Accueille({Key? key}) : super(key: key);

  @override
  State<Accueille> createState() => _AccueilleState();
}

class _AccueilleState extends State<Accueille> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //appBar
            Container(
              width: phoneWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu_rounded)),
                  Container(
                    margin: EdgeInsets.only(
                        top: phoneHeight * 0.02, bottom: phoneHeight * 0.02),
                    width: phoneWidth * 0.25,
                    height: phoneHeight * 0.1,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(
                          'image/logo2.png',
                        ))),
                  )
                ],
              ),
            ),
            //search button
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Search()));
              },
              child: Container(
                width: phoneWidth * 0.6,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 240, 239, 239),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.search),
                    Text('search for a product')
                  ],
                ),
              ),
            ),
            //pub
            Container(
              margin: EdgeInsets.only(bottom: phoneHeight * 0.02),
              width: phoneWidth,
              height: phoneHeight * 0.4,
              child: CarouselSliderExample(),
            ),

            Container(
              height: phoneHeight,
              child: const Tabbar(),
            )
          ],
        ),
      ),
      drawer: MyDrawerContents(),
    );
  }
}

class MyDrawerContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      width: 200,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )),
              Text("|"),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ))
            ],
          )),
          ListTile(
            title: Text("Today's Vendor"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
          ListTile(
            title: Text("Promotion"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
          ListTile(
            title: Text("Wholesale"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
          ListTile(
            title: Text("Invite a friend"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
          ListTile(
            title: Text("About Us"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
          ListTile(
            title: Text("Setting"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UnknownScreen()));
            },
          ),
        ],
      ),
    ));
  }
}

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("image/talon.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("image/iamgroth.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("image/pub.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage("image/car.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}
