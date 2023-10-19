import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyLabel extends StatelessWidget {
  String label;
  bool isSelect;
  MyLabel({super.key,required this.label,required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:isSelect==false? Container(
             color: const Color(0xFFF8F8F8),
            height:50,
            child: Row(
              children: [
                const SizedBox(width:20,),
                Text(label,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),softWrap: true,),
              ],
            )
            ):
            Column(children: [
               Text(label,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize:13,fontWeight: FontWeight.w600)),softWrap: true,),
             
            ],),
    );
 
  }
}