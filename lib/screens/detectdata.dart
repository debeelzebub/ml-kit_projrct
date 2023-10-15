import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyDetectdata extends StatelessWidget {
  String label,confi;
  MyDetectdata({super.key,required this.label,required this.confi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
             color: const Color(0xFFF8F8F8),
            height:100,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category",style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18)),softWrap: true,),
                        Text("Accuracy Level",style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18)),softWrap: true,),
                      ],
                    ),
                    const SizedBox(width:30,)
,                Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),softWrap: true,),
                        Text(confi,style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.green)),softWrap: true,),
                      
                      ],
                    )
                  ],
                ),
              ],
            )),
    );
  }
}