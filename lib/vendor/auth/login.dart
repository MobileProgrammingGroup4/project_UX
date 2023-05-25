import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lookam/vendor/auth/sub_loging/createAccount.dart';
import 'package:lookam/vendor/auth/sub_loging/forgotPass.dart';
import 'package:lookam/vendor/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  late String email = '';
  late String pass = '';

  bool _isSecrect = true;
  List<bool?> data = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'image/market.jpeg',
              ),
              fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text("LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                   style:const TextStyle(
                                    color: Color.fromARGB(255, 253, 253, 253)
                                  ),
                                  cursorColor: Colors.white,
                                  onChanged: (value) =>
                                      setState(() => email = value),
                                  validator: (value) => value!.isEmpty ||
                                          !emailRegexp.hasMatch(value)
                                      ? 'pleas enter a valid email'
                                      : null,
                                  decoration: const InputDecoration(
                                    // hintText: 'Enter your E-mail',
                                    label: Text('Enter your E-mail'),
                                    labelStyle: TextStyle(color: Colors.white),

                                    // border: InputBorder.bottom,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style:const TextStyle(
                                    color: Color.fromARGB(255, 253, 253, 253)
                                  ),
                                  cursorColor: Colors.white,
                                  obscureText: _isSecrect,
                                  decoration: InputDecoration(
                                      //border: InputBorder.none,
                                      iconColor: Colors.white,
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                            () => _isSecrect = !_isSecrect),
                                        child: Icon(!_isSecrect
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      // hintText: 'Enter your password',
                                      label: const Text("Enter your password"),
                                      labelStyle:
                                          const TextStyle(color: Colors.white)),
                                  onChanged: (value) =>
                                      setState(() => pass = value),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          //padding: const EdgeInsets.all(10),
                          width: 200,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                print(email);
                                print(pass);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  print("forgot password");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPass()));
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 43, 98, 201),
                                      fontWeight: FontWeight.bold),
                                )),
                            const Text("|"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Signup(),
                                      ));
                                  print("create an account");
                                },
                                child: const Text(
                                  'Create an account',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 43, 98, 201),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
