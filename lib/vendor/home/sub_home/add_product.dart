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
                  Container(
                    width: 200,
                    child: ElevatedButton(onPressed: (){}, child: const Text('Upload image')),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical:20),
                    height: phoneHeight*0.5,
                    width: phoneWidth*0.6,
                    decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color.fromARGB(255, 8, 82, 143),
              ),
                  ),
                  Container(
                    width: 200,
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
      )
    );
  }
}
