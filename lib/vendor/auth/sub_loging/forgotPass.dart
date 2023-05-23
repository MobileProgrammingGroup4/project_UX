import 'dart:math';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text("LookAm"),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
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
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.white,
                              )),
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter the code you received',
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
                      ElevatedButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            print("is ok");
                          }
                        },
                        child: const Text("Submit"))
                  ],
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}
