import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/agroproduct.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/clothes.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';



/*class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  var holder = const TopProduc();
  bool oneISSelected = true;
  bool twoISSelected = false;
  bool threeISSelected = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 0,
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                child: Text(
                  'Top product',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Agro product',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Clothes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 50,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 50,
                child: TopProduc(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 50,
                child: Agroproduct(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 50,
                child: Clothes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  var holder = const TopProduc();
  bool oneISSelected = true;
  bool twoISSelected = false;
  bool threeISSelected = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 0,
            bottom: const TabBar(
              isScrollable: false,
              tabs: [
                Tab(
                  child: Text(
                    'Top product',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Agro product',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Clothes',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), // disable vertical scrolling
            children: [
              Center(child:TopProduc() ),
              Center(child: Agroproduct(),),
              Center(child: Clothes(),),
            ],
          ),

          /*SingleChildScrollView(
           // physics:const NeverScrollableScrollPhysics(),
            child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight ,
          child: TabBarView(
            physics:const NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight,
                child: TopProduc(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight,
                child: 
              ),
              Container(
                height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight,
                child: 
              ),
            ],
          ),
        ),
          )*/
        ));

    /* return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneISSelected = true;
                    twoISSelected = false;
                    threeISSelected = false;
                  });
                },
                child: Container(
                  decoration: oneISSelected==true
                  ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 52, 105, 148),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                  child: const Text("Top Product"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    oneISSelected = false;
                    twoISSelected = true;
                    threeISSelected = false;
                  });
                },
                child: Container(
                  decoration: twoISSelected==true
                  ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 52, 105, 148),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                  child: const Text("Agro Product"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    threeISSelected = true;
                    oneISSelected = false;
                    twoISSelected = false;
                  });
                },
                child: Container(
                  decoration: threeISSelected==true
                  ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 52, 105, 148),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                  child: const Text("Cloths"),
                ),
              )
            ],
          ),
          if (oneISSelected = true) const Expanded(child: TopProduc()),
          if (twoISSelected = true) const Expanded(child: Agroproduct()),
          if (threeISSelected = true) const Expanded(child: Clothes()),
        ],
      ),
    );*/
  }
}
