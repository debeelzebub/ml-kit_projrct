// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FunctionButton extends StatefulWidget {
  final String text;
  bool? isSelect=false;
  bool? isColor=false;
  bool? isColor2=false;
  VoidCallback onTap;
  FunctionButton({super.key,required this.text,required this.isSelect,this.isColor,this.isColor2,required this.onTap});

  @override
  State<FunctionButton> createState() => _FunctionButtonState();
}

class _FunctionButtonState extends State<FunctionButton> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      child: Container(
        width: 40,
        height: 50,
        decoration: BoxDecoration(
          color:widget.isSelect==true?
          widget.isColor==false? const Color.fromARGB(24, 0, 115, 230):const Color(0xFF0073E6):
          widget.isColor2==false? const Color.fromARGB(24, 0, 115, 230):const Color(0xFF0073E6),
          borderRadius: BorderRadius.circular(35)
        ),
        child: Center(child: Text(widget.text,style:GoogleFonts.inter(textStyle:  TextStyle(
          color:widget.isSelect==true? 
          widget.isColor==false?const Color(0xFF0073E6):Colors.white:
          widget.isColor2==false?const Color(0xFF0073E6):Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15.5 ),))),
      ),
    );
  }
}