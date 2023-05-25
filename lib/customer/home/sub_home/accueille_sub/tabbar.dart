import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/agroproduct.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/clothes.dart';
import 'package:lookam/customer/home/sub_home/accueille_sub/topProduc.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 0,
            bottom:const  TabBar(
              tabs: [
                Tab(child: Text('Top product',
                style: TextStyle(
                  color: Colors.black
                ),
                ),),
                Tab(child: Text('Agro product',
                style: TextStyle(
                  color: Colors.black
                ),
                ),),
                Tab(child: Text('Clothes',
                style: TextStyle(
                  color: Colors.black
                ),
                ),),
              ],
            ),
          ),
          body: const TabBarView(children: [
            TopProduc(),
            Agroproduct(),
            Clothes(),
          ]),
        )
        );
  }
}
