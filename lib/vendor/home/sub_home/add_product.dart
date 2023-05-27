import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String productName;
  late String category;
  late String price;
  late String quantity;

   XFile? image1;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image1 = img;
    });
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                    onChanged: (value) => setState(() => productName = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas the name of a product' : null,
                    decoration: InputDecoration(
                      labelText: 'product Name',
                     
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                           // color: Colors.white,
                          )),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                    onChanged: (value) => setState(() => category = value),
                    validator: (value) => value!.isEmpty
                        ? 'What is the category of the product'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'product category',
                     
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                          //  color: Colors.white,
                          )),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => productName = value),
                    validator: (value) => value!.isEmpty
                        ? 'What is the price of the product'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'product Price',
                     
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                           // color: Colors.white,
                          )),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: TextFormField(
                    onChanged: (value) => setState(() => quantity = value),
                    validator: (value) =>
                        value!.isEmpty ? 'What is the quantity for that price' : null,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            //color: Colors.white,
                          )),
                    ),
                  ),
                  ),
                 ElevatedButton(
                  onPressed: () {
                    myAlert();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  ))),
                  child: const Text('Upload Product image'),
                ),
                const SizedBox(
                  height: 10,
                ),
                //if image not null show the image
                //if image null show text
                image1 != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            //to show image, you type like this.
                            File(image1!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: phoneHeight * 0.3,
                          ),
                        ),
                      )
                    : const Text(
                        "No Image",
                        style: TextStyle(fontSize: 20),
                      ),
                 
                  Container(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          print(productName);
                        },
                        style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  ))),
                        child: const Text("Submit")),
                  )
                ],
              ),
            )),
      ),
      )
    );
  }
}
