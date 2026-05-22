import 'package:flutter/material.dart';

class Appbarbutton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  Appbarbutton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.black),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}