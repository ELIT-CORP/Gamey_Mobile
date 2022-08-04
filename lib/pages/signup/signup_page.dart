import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import '../../auth/auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();

  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      Get.offNamed("/");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/png/signup_bg.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset("assets/images/png/char.png"),
                ),
                Center(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26, top: 20, bottom: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
                              controller: _controllerEmail,
                              decoration:
                                  InputDecoration(labelText: "Username", hintText: "Insira seu email"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Email inválido';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _controllerPassword,
                              obscureText: !_passwordVisible,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     // Based on passwordVisible state choose the icon
                                //     _passwordVisible
                                //         ? Icons.visibility
                                //         : Icons.visibility_off,
                                //     color: Theme.of(context).primaryColorDark,
                                //   ),
                                //   onPressed: () {
                                //     // Update the state i.e. toogle the state of passwordVisible variable
                                //     setState(() {
                                //       _passwordVisible = !_passwordVisible;
                                //     });
                                //   },
                                // ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (value.length < 8) {
                                  return 'Minímo de 8 caracteres';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _controllerConfirmPassword,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                  labelText: "Confirm Password"),
                              validator: (value) {
                                if (value != _controllerPassword.text) {
                                  return 'As senhas não coincidem';
                                } else if (value == null || value.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (value.length < 8) {
                                  return 'Minímo de 8 caracteres';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 24, right: 24),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEFFB0E),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(0, 3)),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Processing Data')),
                                      );
                                      createUserWithEmailAndPassword();
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Next",
                                      style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
