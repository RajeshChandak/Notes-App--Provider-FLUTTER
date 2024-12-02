import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(
      {required TextEditingController controller,
      required TextInputType TextInputType,
      required String hinttext,
      required IconData icondata}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: TextField(
        keyboardType: TextInputType,
        controller: controller,
        style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "regular"),
        decoration: InputDecoration(
            prefixIcon: Icon(icondata, color: Colors.deepPurple,),
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.white, fontFamily: "regular"),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none))),
      ),
    );
  }
}



















