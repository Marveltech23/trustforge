import 'package:flutter/material.dart';

class MChipTheme {
  MChipTheme._();


  static ChipThemeData lightChipTheme = ChipThemeData(
  disabledColor: Colors.grey.withOpacity(0.4), 
  labelStyle: const  TextStyle(color: Colors.black),
  selectedColor: Colors.amber, 
  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), 
  checkmarkColor: Colors.white, 
  );


  static ChipThemeData darkChipTheme = const  ChipThemeData(
  disabledColor: Colors.grey, 
  labelStyle:  TextStyle(color: Colors.white),
  selectedColor: Colors.amber, 
  padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), 
  checkmarkColor: Colors.white, 
  );



}
