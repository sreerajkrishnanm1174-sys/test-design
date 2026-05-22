import 'package:flutter/material.dart';

class Hall extends StatefulWidget {
  const Hall({ Key? key }) : super(key: key);

  @override
  _HallState createState() => _HallState();
}

class _HallState extends State<Hall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hall"),
    );
  }
}