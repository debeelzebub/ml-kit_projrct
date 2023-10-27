import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyDetectdata extends StatelessWidget {
  String label,confi;
  MyDetectdata({super.key,required this.label,required this.confi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
         decoration: ShapeDecoration(
              color:const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              shadows:const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 1,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            //  color: const Color(0xFFF8F8F8),
            height:70,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category",style: GoogleFonts.inter(textStyle: const TextStyle(fontSize:14,fontWeight: FontWeight.w400)),softWrap: true,),
                        Text("Accuracy Level",style: GoogleFonts.inter(textStyle: const TextStyle(fontSize:14,fontWeight:FontWeight.w400)),softWrap: true,),
                      ],
                    ),
                    const SizedBox(width:30,)
    ,                Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),softWrap: true,),
                        Text(confi,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.green)),softWrap: true,),
                      
                      ],
                    )
                  ],
                ),
              ],
            )),
    );
  }
}