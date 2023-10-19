// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class MyImage extends StatelessWidget {
  final VoidCallback onTap;
  final XFile imageFile;
  const MyImage({super.key, required this.imageFile,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 205, 218, 219),
            height: 300,
            width: 350,
            child: Image.file(File(imageFile.path),fit: BoxFit.cover,)
          ),
          Positioned(
            left: 300,
            child: IconButton(onPressed:onTap, icon:const Icon(Icons.qr_code_scanner,size: 35,color: Colors.white,)))
        ],
      ),
    );
  }
}