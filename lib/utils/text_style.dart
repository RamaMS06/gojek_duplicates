import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  static TextStyle light() =>
      const TextStyle(fontWeight: FontWeight.w400, color: Colors.black);

  static TextStyle medium() =>
      const TextStyle(fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle bold() =>
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
}
