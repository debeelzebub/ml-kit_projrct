import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectfirebase/data/data_source.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
   XFile? imageFile;
 ImageDataSource data = ImageDataSource();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(    
          height:220,
          decoration: BoxDecoration(
            image:const DecorationImage(
              image: AssetImage("assets/image/Maskgroup.png",),
              fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          child: Text(
            'A well-labeled image \n speaks thousand words.',softWrap: true,
            textAlign: TextAlign.center,
            style:GoogleFonts.inter(
              textStyle:const TextStyle(
                color: Colors.black,
                fontSize:18,fontWeight: FontWeight.w600,
              ),
            )
          ),
        ), 
      ],
    );
  }
}