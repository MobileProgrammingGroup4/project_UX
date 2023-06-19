import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lookam/customer/home/sub_home/Clothes/vetements.dart';
import 'package:url_launcher/url_launcher.dart';

class ClothsSelect extends StatefulWidget {
  
  const ClothsSelect({ super.key });

  @override
  State<ClothsSelect> createState() => _ClothsSelectState();
}

class _ClothsSelectState extends State<ClothsSelect> {
void launchWhatsApp({
    required int phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

   @override
   Widget build(BuildContext context) {
     var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;

      Habit product = ModalRoute.of(context)!.settings.arguments as Habit;
       return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poduct details'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          children: [
           
                  Container(
                    margin: const EdgeInsets.only(top:30, bottom: 15),
                     width: 200,
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Product name: ${product.name}",
              style:const TextStyle(
                fontSize: 20,
                 fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Product price: ${product.price}",
              style:const TextStyle(
                fontSize: 20,
                 fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Product category: ${product.description}",
              style:const TextStyle(
                fontSize: 20,
                 fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(15),
              child: Text("Vendor name: ${product.vendorname}",
              style:const TextStyle(
                fontSize: 20,
                 fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              ),
            ),

            Row(
              children: [
                const  Padding(
              padding:  EdgeInsets.all(15),
              child: Text("contaoct vendor",
              style: TextStyle(
                fontSize: 19,
                
              ),
              ),
            ),

           Container(
            width: phoneWidth*0.5,
            child:  GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: phoneWidth * 0.9,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ImageIcon(
                    AssetImage('image/whatsapp.png'),
                    size: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "whatsapp",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              launchWhatsApp(phone: 237682608736, message: 'Hello');
            },
          ),
           )
              ],
            )

          
          ],
        ),
        )
      ),
    );
  }
}
