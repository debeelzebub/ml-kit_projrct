import 'package:flutter/material.dart';

class Gridlist{
  final Color? color;
  final Icon? icon;
  String? text;
  Gridlist({required this.color,required this.icon,required this.text});
}

List<Gridlist> list=[
  Gridlist(color: const Color(0xFF4485FD), icon: const Icon(Icons.join_left,color: Colors.white,size: 38,),text:"Barcode Scanning"),
  Gridlist(color: const Color(0xFFA584FF), icon: const Icon(Icons.shutter_speed_outlined,color: Colors.white,size: 38,),text:"Device Translation"),
  Gridlist(color: const Color(0xFFFF7854), icon: const Icon(Icons.photo_library_outlined,color: Colors.white,size: 38,),text:"Image Detection"),
  Gridlist(color: const Color(0xFFFDA625), icon: const Icon(Icons.add_reaction_outlined,color: Colors.white,size: 38,),text:"Face Detection"),
  Gridlist(color: const Color(0xFF00CC6A), icon: const Icon(Icons.photo_size_select_large_sharp,color: Colors.white,size: 38,),text:"Object Detection"),
  Gridlist(color: const Color(0xFF00C9E4), icon: const Icon(Icons.add_to_photos_outlined,color: Colors.white,size: 38,),text:"Smart Reply"),
  Gridlist(color: const Color(0xFFFD43B3), icon: const Icon(Icons.format_shapes,color: Colors.white,size: 38,),text:"Text Recognition"),
  Gridlist(color: const Color(0xFFFD4343), icon: const Icon(Icons.draw_outlined,color: Colors.white,size: 38,),text:"Digital Ink Recognition"),
  Gridlist(color: const Color.fromARGB(255, 184, 209, 134), icon: const Icon(Icons.language,color: Colors.white,size: 38,),text:"Language Identification")




];