import 'package:flutter/material.dart';

class KeyModel {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;

  const KeyModel(
      {required this.icon, required this.onPressed, required this.color});
}
