// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class MyImage extends StatelessWidget {
  final XFile imageFile;
  const MyImage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20,right:20),
      child: Container(
        color:const Color.fromARGB(255, 220, 221, 221),
        height: 300,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: SizedBox(
            height: 300,
            width: 200,
            child: Image.file(File(imageFile.path),fit:BoxFit.fill,)),
        )
      ),
    );
  }
}