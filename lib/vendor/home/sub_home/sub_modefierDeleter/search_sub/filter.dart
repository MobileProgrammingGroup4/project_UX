import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectCategory = '';

  //List<String>  = [];
  String selectProduct = '';
  String price = '';

  List<String> Category = [
    "Shoe",
    "Clothes",
    "vegetable",
    "produit frais",
    "cereal"
  ];
  List<String> product = [
    "Select All",
    "Clothing",
    "Cafe",
    "Entertainment",
    "Gallery",
    "Gift Shop",
    "Gym",
    "Movie Theater",
    "Museum",
    "Pub/Bar",
    "Retail",
    "Restaurant",
    "Sports"
  ];

  List<String> article(String a) {
    List<String> product1 = [
      "Air force 1",
      "All Start",
      "Landalouse",
      "pantoufle",
      "balenciaga"
    ];
    List<String> product2 = [
      "T-shirt",
      "one love",
      "big friends",
      "2 face",
      "balenciaga"
    ];
    List<String> product3 = [
      "carotte",
      "tomato",
      "green peper",
      "pink peper",
      "blorew"
    ];
    List<String> product4 = [
      "porc meat",
      "beef Stack",
      "fish",
      "something blue",
      "la petite sirenne"
    ];
    List<String> product5 = ["beans", "rice", "gari", "corn", "pepe"];
    if (a == "Shoe") {
      return product1;
    }
    if (a == "Clothes") {
      return product2;
    }
    if (a == "vegetable") {
      return product3;
    }
    if (a == "produit frais") {
      return product4;
    }
    if (a == "cereal") {
      return product5;
    }
    return product1;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var phoneHeight = mediaQuery.size.height;
    var phoneWidth = mediaQuery.size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.03),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // filters for price range
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: phoneHeight * 0.01, horizontal: phoneWidth * 0.02),
              child: Text(
                "Category",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),

            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              children: Category.map((item) => IntrinsicWidth(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectCategory = item;

                          print(selectCategory);
                        });
                      },
                      child: Container(
                        // height: phoneHeight * 0.06,
                        padding: EdgeInsets.symmetric(
                            vertical: phoneHeight * 0.015,
                            horizontal: phoneWidth * 0.05),
                        decoration: selectCategory == item
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 52, 105, 148),
                              )
                            : BoxDecoration(
                                color: Colors.grey.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(100),
                              ),
                        child: Center(
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                  )).toList(),
            ),

            // filters for business type
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: phoneHeight * 0.01, horizontal: phoneWidth * 0.02),
              child: Text(
                "Product",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              children: article(selectCategory)
                  .map((item) => IntrinsicWidth(
                        child: TextButton(
                          onPressed: () {
                            // print("tapped " + item.toString());
                            setState(() {
                              selectProduct = item;

                              print(selectProduct);
                            });
                          },
                          child: Container(
                            // height: phoneHeight * 0.06,
                            // width: phoneWidth * 0.35,
                            padding: EdgeInsets.symmetric(
                                vertical: phoneHeight * 0.015,
                                horizontal: phoneWidth * 0.06),
                            decoration: selectProduct == item
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 52, 105, 148),
                                  )
                                : BoxDecoration(
                                    color: Colors.grey.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                            child: Text(
                              item,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) => setState(() => selectProduct = value),
                  decoration: InputDecoration(
                    hintText: "any particular product in mind?",
                  ),
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: phoneHeight * 0.01, horizontal: phoneWidth * 0.02),
              child: Text(
                "Price",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) => setState(() => price = value),
                  decoration: InputDecoration(
                    hintText: "At what price do you want it?",
                  ),
                )),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    print('you want $selectProduct for  $selectCategory at a price of $price');
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side:const BorderSide(color: Colors.red)
                  ))),
                  child: const Text("Search")),
            )
          ],
        ),
      ),
    );
  }
}
