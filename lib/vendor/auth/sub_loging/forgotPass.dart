import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final RegExp phoneRegx =
      RegExp(r"^(6[1-9][1-9])([0-9][0-9])([0-9][0-9])([0-9][0-9])$");

      late String phone = '';
      final phoneCtl = TextEditingController();
      late String hidedCode = '';
      late String num = '';

    String code() {
    var rndnumber = "";
    var rnd = Random();
    for (var i = 0; i < 4; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    return rndnumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'image/market.jpeg',
              ),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: Center (
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("LookAm",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: TextFormField(
                         style:const TextStyle(
                                    color: Color.fromARGB(255, 253, 253, 253)
                                  ),
                                  cursorColor: Colors.white,
                       controller: phoneCtl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: () {
                              hidedCode = code();
                              if (phoneRegx.hasMatch(phoneCtl.text)) {
                                print(
                                    "Send this code $hidedCode at this number ${phoneCtl.text}");
                              }
                            },
                            child: const Icon(
                              Icons.gpp_good,
                              color: Color.fromARGB(255, 228, 131, 245),
                            ),
                          ),
                          labelText: 'Enter your phone number',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                         /* enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.white,
                              )),*/
                        ),
                         
                        onChanged: (value) => setState(() => num = value),
                        validator: (value) {
                          if (value!.isEmpty || !phoneRegx.hasMatch(value)) {
                            return 'please enter a valid phone number';
                          }
                          phone = phoneCtl.text;
                          return null;
                        },
                    ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                         style:const TextStyle(
                                    color: Color.fromARGB(255, 253, 253, 253)
                                  ),
                                  cursorColor: Colors.white,
                      keyboardType: TextInputType.number,
                      decoration:const InputDecoration(
                        labelText: 'Enter the code you received',
                          labelStyle:  TextStyle(
                            color: Colors.white,
                          ),
                          /*enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.white,
                              )),*/
                        ),
                      ),
                    ),
                     Container(
                      width: 200,
                      margin:const EdgeInsets.only(top:30),
                      child:  ElevatedButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            print("is ok");
                          }
                        },
                        child: const Text("Submit")),
                     )
                  ],
                )
                )
            ],
          ),
        ),
      ),
        ),
      )
    );
  }
}
