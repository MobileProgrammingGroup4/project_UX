import 'package:flutter/material.dart';

import 'search_sub/filter.dart';

class Search extends StatefulWidget {

  const Search({ Key? key }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 201, 198, 198),
            title: const Text('Search Product',
            style: TextStyle(
              
            ),
            ),
            ),
           body: SingleChildScrollView(
            child:Filter() ,
            
           ),
       );
  }
}