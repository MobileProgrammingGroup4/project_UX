import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: 200,
              child:Image.asset('image/under.jpeg'),
            ),
        
        /*Column(
          children: [
            
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 200,
              child:Image.asset('image/under.jpeg'),
            ),
            
           const Padding(padding: const EdgeInsets.all(20),
            child: Text('Sorry coming soon'),
            )
          ],
        ),*/
      ),
    );
  }
}

