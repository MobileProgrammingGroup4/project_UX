import 'package:flutter/material.dart';
import 'package:lookam/vendor/auth/sub_loging/createAccount.dart';

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(150, 30)),
                  image: DecorationImage(
                    image: AssetImage(
                      'image/market.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text("LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding:const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Container(
                        padding:const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 234, 143, 250),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [

                            Container(
                              padding: const EdgeInsets.all(8.0),
                              
                              child: TextFormField(
                                onChanged: (value) => setState(() => email = value),
                                validator: (value) =>
                                value!.isEmpty || !emailRegexp.hasMatch(value)
                                ? 'pleas enter a valid email'
                                : null,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your E-mail',
                                  border: InputBorder.none,
                                ),
                                
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              
                              child: TextFormField(
                                obscureText: _isSecrect,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                        () => _isSecrect = !_isSecrect),
                                    child: Icon(!_isSecrect
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  hintText: 'Enter your password',
                                ),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 212, 84, 235),
                                Color.fromARGB(255, 226, 157, 238)
                              ]),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                            if(_formkey.currentState!.validate()){
                              print(email);
                              print(pass);
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
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
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )),
                        const  Text("|"),
                           TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ));
                            print("create an account");
                          },
                          child: const Text(
                            'Create an account',
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )),
                      ],
                     ),
                          ],
                        ),
                        )
                    ],

                  ),
                ),
              ),
            ],
          ),
        ));
  }
}