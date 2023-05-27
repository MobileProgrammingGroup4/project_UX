import 'package:flutter/material.dart';

class Modifycomplet extends StatefulWidget {

  const Modifycomplet({ Key? key }) : super(key: key);

  @override
  State<Modifycomplet> createState() => _ModifycompletState();
}

class _ModifycompletState extends State<Modifycomplet> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const Icon(Icons.done,
               size: 100,
               ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
               child: Center(
                child: Text("The product have been modify",
               style: TextStyle(
                //overflow: TextOverflow.fade,
                fontSize: 30,
               ),
               ),
               )
               ),
               Container(
                width: 200,
                child: ElevatedButton(onPressed: (){
                  Navigator.popUntil(context, ModalRoute.withName('/Home'));
                }, child: const Text("Done")),
               )
              ],
            ),
           ),
           )
       );
  }
}