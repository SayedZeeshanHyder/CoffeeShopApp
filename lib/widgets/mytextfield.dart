import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{

  final controller;
  final prefixIcon;
  final inputType;
  final bool obsuretext;
  final hinttext;

  MyTextField({required this.hinttext,required this.controller,this.obsuretext=false,required this.prefixIcon,required this.inputType});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obsuretext,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

}