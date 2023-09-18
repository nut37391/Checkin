import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smartoffice/button/bottomnavibar.dart';
import 'package:smartoffice/button/loginbutton.dart';
import 'package:smartoffice/user_auth/firebase_auth_implement/firebase_auth_service.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => __LoginStateState();
}

class __LoginStateState extends State<loginpage> {
  // final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                child: Image.asset(
                  'lib/images/logo/logo.png',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  'SMART OFFICE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Human Resource',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                width: 311,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffE2E2E2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Email: ',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: 311,
                height: 50,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffE2E2E2),
                      width: 0,
                    ),
                    left: BorderSide(
                      color: Color(0xffE2E2E2),
                      width: 1,
                    ),
                    right: BorderSide(
                      color: Color(0xffE2E2E2),
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: Color(0xffE2E2E2),
                      width: 1,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: 14),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password: ',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 311,
                height: 52,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFF75772),
                    ),
                  ),
                  onPressed: () {
                    // _signIn();
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _signIn() async {
  //   try {
  //     String email = _emailController.text;
  //     String password = _passwordController.text;

  //     UserCredential user = await _auth.signIn(email, password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
}
