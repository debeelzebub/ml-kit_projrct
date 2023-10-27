// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
   VoidCallback? onTap;
   String title;
   MyButton({super.key, required this.onTap,required this.title});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return  ElevatedButton(
    onPressed: widget.onTap, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF0073E6),),
      padding: MaterialStateProperty.all( EdgeInsets.symmetric(horizontal:w/7,
      vertical: h/50))
    ),
    child:Text(widget.title,style:const TextStyle(color: Colors.white,fontSize: 16),)
    );
  }
}