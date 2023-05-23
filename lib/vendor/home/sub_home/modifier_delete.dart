import 'package:flutter/material.dart';

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
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: phoneHeight * 0.1,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 8, 82, 143),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Modify')),
                  ElevatedButton(onPressed: () {}, child: const Text("Delete")),
                ],
              ),
            ),
            isForModify
                ? Expanded(
                    child: Form(
                    child: Column(children: [
                      TextFormField(
                        onChanged: (value) =>
                            setState(() => productName = value),
                        validator: (value) => value!.isEmpty
                            ? 'pleas the name of a product'
                            : null,
                        decoration: InputDecoration(
                          labelText: productName,
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
                          labelText: category,
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
                        onChanged: (value) =>
                            setState(() => productName = value),
                        validator: (value) => value!.isEmpty
                            ? 'What is the price of the product'
                            : null,
                        decoration: InputDecoration(
                          labelText: price,
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
                        validator: (value) => value!.isEmpty
                            ? 'What is the quantity for that price'
                            : null,
                        decoration: InputDecoration(
                          labelText: quantity,
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formulare.currentState!.validate()) {
                                print('it is ok');
                              }
                            },
                            child: const Text("Modify")),
                      )
                    ]),
                  ))
                : const Expanded(child: Text('data'))
          ],
        ),
      ),
    );
  }
}
