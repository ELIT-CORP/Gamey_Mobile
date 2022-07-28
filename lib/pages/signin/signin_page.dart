import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamey_flutter/auth/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      Get.offNamed("/");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/png/signin_bg.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.asset("assets/images/png/char.png"),
            ),
            Center(
              child: Container(
                height: 300,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _controllerEmail,
                            decoration: InputDecoration(labelText: "Username"),
                          ),
                          TextFormField(
                            controller: _controllerPassword,
                            decoration: InputDecoration(labelText: "Password"),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFF98CE00),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text("Login"),
                          ),
                        ),
                      ),
                      onTap: () {
                        this.signInWithEmailAndPassword();
                      },
                    ),
                    //TODO: add styles text
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offNamed("/signup");
                                }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
