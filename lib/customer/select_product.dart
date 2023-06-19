import 'package:flutter/material.dart';

import 'home/sub_home/Clothes/chaussure.dart';


class SelectProduct extends StatefulWidget {
  const SelectProduct({Key? key}) : super(key: key);

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {

  @override
  
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;

      Product product = ModalRoute.of(context)!.settings.arguments as Product;
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
            )
          ],
        ),
        )
      ),
    );
  }
}
