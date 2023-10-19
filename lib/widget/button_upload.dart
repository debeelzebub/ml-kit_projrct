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
    return  ElevatedButton(
    onPressed: widget.onTap, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF0073E6),),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal:70,
      vertical: 15))
    ),
    child:Text(widget.title,style:const TextStyle(color: Colors.white,fontSize: 16),)
    );
  }
}