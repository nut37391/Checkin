import 'package:flutter/material.dart';

class loginbutton extends StatefulWidget {
  const loginbutton({super.key});

  @override
  State<loginbutton> createState() => _loginbuttonState();
}

class _loginbuttonState extends State<loginbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      height: 52,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFFF75772),
          ),
        ),
        onPressed: () {},
        child: Text('Login'),
      ),
    );
  }
}
