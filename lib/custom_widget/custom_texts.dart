import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
// const Texts({Key? key}) : super(key: key);
  Texts({
   required this.title,
    required this.color,
     this.fontsize : 15.0,
    this.fontWeight :  FontWeight.normal,
  });

  final String title;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
