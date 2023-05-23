import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => setState(() => productName = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas the name of a product' : null,
                    decoration: InputDecoration(
                      labelText: 'product Name',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => category = value),
                    validator: (value) => value!.isEmpty
                        ? 'What is the category of the product'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'product category',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) => setState(() => productName = value),
                    validator: (value) => value!.isEmpty
                        ? 'What is the price of the product'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'product Price',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) => setState(() => quantity = value),
                    validator: (value) =>
                        value!.isEmpty ? 'What is the quantity for that price' : null,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 160,
                    color: Colors.pinkAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          print(productName);
                        },
                        child: const Text("Submit")),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
