import 'package:flutter/material.dart';
import 'sub_modefierDeleter/modifycomplet.dart';

class ModifierDelete extends StatefulWidget {
  const ModifierDelete({Key? key}) : super(key: key);

  @override
  State<ModifierDelete> createState() => _ModifierDeleteState();
}

class _ModifierDeleteState extends State<ModifierDelete> {
  final GlobalKey<FormState> _formulare = GlobalKey<FormState>();

  bool isForModify = false;
  String productName = "Carrot";
  String category = "Vegetable";
  String quantity = "3";
  String price = "200";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 155, 154, 154),
        title: const Text('Modify Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              height: phoneHeight * 0.5,
              width: phoneWidth * 0.6,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("image/legume_carotte.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(" $productName , $quantity for $price",
                               
                              //style: Theme.of(context).textTheme.headline5,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isForModify = true;
                          });
                        },
                        style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  ))),
                        child: const Text('Modify')),
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isForModify = false;
                          });
                        },
                        style: ButtonStyle(
                           
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  )),
                 
                  ),
                        child: const Text("Delete")),
                  ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: isForModify
                        ? Form(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: TextFormField(
                                  onChanged: (value) =>
                                      setState(() => productName = value),
                                  validator: (value) => value!.isEmpty
                                      ? 'pleas the name of a product'
                                      : null,
                                  decoration: InputDecoration(
                                    hintText: productName,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: TextFormField(
                                  onChanged: (value) =>
                                      setState(() => category = value),
                                  validator: (value) => value!.isEmpty
                                      ? 'What is the category of the product'
                                      : null,
                                  decoration: InputDecoration(
                                    hintText: category,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) =>
                                      setState(() => productName = value),
                                  validator: (value) => value!.isEmpty
                                      ? 'What is the price of the product'
                                      : null,
                                  decoration: InputDecoration(
                                    hintText: price,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                child: TextFormField(
                                  onChanged: (value) =>
                                      setState(() => quantity = value),
                                  validator: (value) => value!.isEmpty
                                      ? 'What is the quantity for that price'
                                      : null,
                                  decoration: InputDecoration(
                                    hintText: quantity,
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                    onPressed: () {
                                      print('good morning');
                                      Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Modifycomplet()));
                                      /*if (_formulare.currentState!.validate()) {
                                  
                                  };*/
                                    },
                                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  ))),
                                    child: const Text("Modify")),
                              )
                            ]),
                          )
                        : const Text('')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
