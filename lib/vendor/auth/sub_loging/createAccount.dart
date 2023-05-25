import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int currentStep = 0;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final RegExp phoneRegx =
      RegExp(r"^(6[1-9][1-9])([0-9][0-9])([0-9][0-9])([0-9][0-9])$");
  final RegExp codeRegx = RegExp(r'^([0-9])([0-9])([0-9])([0-9])$');

  late String email = '';
  late String username = '';
  late String pass = '';
  late String confpass = '';
  late String phone = '';
  late String num = '';
  late String hidedCode = '';
  late String sendCode = '';

  final userName = TextEditingController();
  final emailCtl = TextEditingController();
  final confpassCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final activity = TextEditingController();
  final codeCtl = TextEditingController();

  bool _isSecrect = true;
  List<bool?> data = [true, false];

  String code() {
    var rndnumber = "";
    var rnd = Random();
    for (var i = 0; i < 4; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    return rndnumber;
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Account'),
          content: Form(
            key: _formkey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: emailCtl,
                    onChanged: (value) => setState(() => email = value),
                    validator: (value) =>
                        value!.isEmpty || !emailRegexp.hasMatch(value)
                            ? 'pleas enter a valid email'
                            : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your E-mail',
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: userName,
                    onChanged: (value) => setState(() => username = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas enter your name' : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your Name',
                     // labelStyle: const TextStyle(
                     //   color: Colors.white,b
                     // ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    obscureText: _isSecrect,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isSecrect = !_isSecrect),
                        child: Icon(
                          !_isSecrect ? Icons.visibility : Icons.visibility_off,
                          color: Color.fromARGB(255, 253, 251, 251),
                        ),
                      ),
                      labelText: 'Enter your password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 248, 247, 247),
                      ),
                    ),
                    onChanged: (value) => setState(() => pass = value),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a password';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: confpassCtl,
                    obscureText: _isSecrect,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isSecrect = !_isSecrect),
                        child: Icon(
                          !_isSecrect ? Icons.visibility : Icons.visibility_off,
                          color: Color.fromARGB(255, 252, 251, 251),
                        ),
                      ),
                      labelText: 'Confirm password',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253),
                      ),
                    ),
                    onChanged: (value) => setState(() => confpass = value),
                    validator: (value) {
                      if (value!.isEmpty || confpass != pass) {
                        return 'confirm password';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('Contact'),
            content: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                      child: TextFormField(
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
                            color: Color.fromARGB(255, 17, 17, 17),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 19, 18, 18),
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                      child: TextFormField(
                        controller: codeCtl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter the code you receive',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 15, 15),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 15, 15, 15),
                              )),
                        ),
                        onChanged: (value) => setState(() => hidedCode = value),
                        validator: (value) {
                          if (value!.isEmpty || !codeRegx.hasMatch(value)) {
                            return 'please enter the you receive';
                          }
                          if (codeCtl.text != hidedCode) {
                            return 'The code is not correct';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ))),
        Step(
          isActive: currentStep >= 2,
          title: const Text('Activity'),
          content: Form(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: userName,
                    onChanged: (value) => setState(() => username = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas enter your name' : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your Name',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 10, 10, 10),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: userName,
                    onChanged: (value) => setState(() => username = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas enter your name' : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your Name',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 248, 248, 248),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: userName,
                    onChanged: (value) => setState(() => username = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas enter your name' : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your Name',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 15, 15, 15),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 12, 12, 12),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: userName,
                    onChanged: (value) => setState(() => username = value),
                    validator: (value) =>
                        value!.isEmpty ? 'pleas enter your date ' : null,
                    decoration: InputDecoration(
                      labelText: 'Enter your date of birth',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 17, 17, 17),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 15, 15, 15),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'image/shop.jpeg',
              ),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Center(
              child: Theme(
                data: Theme.of(context).copyWith(
                    backgroundColor: Color.fromRGBO(2, 4, 3, 0),
                    colorScheme: ColorScheme.light(
                        primary: Color.fromARGB(255, 41, 96, 158))),
                child: Stepper(
                  margin: EdgeInsets.only(top: 10, left: 50),
                  elevation: 0,
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    final isFirstForm = currentStep == 0;
                    final isSecondForm = currentStep == 1;

                    if (isFirstForm) {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    }
                    if (isSecondForm) {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          currentStep += 1;
                        });
                      }
                    }

                    if (isLastStep) {
                      print('completed');
                      print('sent data to the server');
                      email = emailCtl.text;
                      username = userName.text;
                      confpass = confpassCtl.text;
                      phone = phoneCtl.text;
                      print(email);
                      print(username);
                      print(confpass);
                      print(phone);
                    }
                  },
                  onStepCancel: () {
                    if (currentStep == 0) {
                      return null;
                    } else {
                      setState(() {
                        currentStep -= 1;
                      });
                    }
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(onPressed: details.onStepContinue, 
                        child: const Text("Next"),
                        ),),
                        const SizedBox(
                          width: 12,
                        ),
                        if(currentStep!=0)
                        Expanded(
                          child: ElevatedButton(onPressed: details.onStepCancel, 
                        child: const Text("Cancel"),
                        )
                          ),
                        
                      ],
                    ),
                    );
                  },
                ),
              ),
            )),
      ),
    );
  }
}