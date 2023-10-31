import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectfirebase/data/data_source.dart';
import 'package:projectfirebase/data/listclass.dart';
import 'package:projectfirebase/widget/button_upload.dart';
import 'package:projectfirebase/widget/detectdata.dart';
import 'package:projectfirebase/widget/facedetectdata.dart';
import 'package:projectfirebase/widget/functionbutton.dart';
import 'package:projectfirebase/widget/page1.dart';
import 'package:projectfirebase/widget/viewimage.dart';

// ignore: must_be_immutable
class MyFaceDetect extends StatefulWidget {
  
 const MyFaceDetect({super.key});

  @override
  State<MyFaceDetect> createState() => _MyFaceDetectState();
}

class _MyFaceDetectState extends State<MyFaceDetect> {

  XFile? imageFile;
    ImageDataSource data = ImageDataSource();
    String result = "";
    bool imlabel=false;
    bool isColor=false;
    bool isColor1=false;
    List<Product>list=[];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(70),
        child: Container(
          decoration:const BoxDecoration(
            color: Color.fromARGB(179, 248, 247, 245),
            boxShadow: [
              BoxShadow(
                color: Color(0x3D000000),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:const Color(0xFFF8F7F5),
            title: GestureDetector(
              onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyFaceDetect() )),
              child: Center(child:Text("Face Detection",style: GoogleFonts.inter(textStyle:const TextStyle(fontWeight: FontWeight.w600)),))),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: imageFile!=null?
            Column(         //2nd page
              children: [
                const SizedBox(height: 10,),
                MyButton(
                  title: "Upload Image",
                  onTap: ()async{
                  list=[];
                  showbottomsheet(context);
                  // imageFile = await data.uploadImage("gallery"); 
                  setState(() {
                    isColor=false;
                    isColor1=false;
                  });
                }),
                const SizedBox(height: 5,),
                const Divider(color: Color.fromARGB(19, 0, 0, 0),thickness: 1.5,),

                MyImage(imageFile: imageFile!),
                const Divider(),
                const SizedBox(height: 5,),
                SizedBox(
                  height: 60,
                  width: w/2,
                  child: FunctionButton(
                    text: "Object Detect",
                    isSelect: false,
                    isColor2: isColor1,
                    onTap:()async{
                     list=await data.detectFace(imageFile!);
                      setState(() {
                      isColor1=true;
                      isColor=false;
                      imlabel=true;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 5,),
                imlabel==true?                // when get data
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
                  child:ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return 
                      DetectFaceData(face: list[index].face, smile: list[index].smile, headRotationX: "${list[index].text}", headRotationY: "${list[index].confi}");
                    }
                      
                  )
                ):const SizedBox()
              ],
            ):
                Padding(  //2nd page
                  padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                  child: Column(
                    children: [
                      const FrontPage(),
                      const SizedBox(height: 20,),
                      MyButton(
                        title: "Upload image",
                        onTap: ()=>showbottomsheet(context)
                      ),
                      const SizedBox(height:10,),
                      Text("No image selected!",style: GoogleFonts.poppins(textStyle:const TextStyle(fontWeight: FontWeight.w400)),),
                    ],
                  )
                ),
        ),
      ),
    );
  }
  showbottomsheet(context){
    showModalBottomSheet(context: context, 
    builder: (BuildContext bc){
      return  Column(mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: ()async{
              imageFile = await data.uploadImage("gallery"); 
              Navigator.of(context).pop();
              setState(() {});
            },
            leading:const Icon(Icons.photo,color: Color(0xFF0073E6)),
            title: Text("Gallery",style: GoogleFonts.inter(textStyle:const TextStyle(color:  Colors.black)),),
          ),
          ListTile(
            onTap: ()async{
              imageFile = await data.uploadImage("camera"); 
              Navigator.of(context).pop();
              setState(() {});
            },
            leading:const Icon(Icons.camera,color: Color(0xFF0073E6),),
            title: Text("Camera",style: GoogleFonts.inter(textStyle:const TextStyle(color:  Colors.black)),),
          ),
        ],
      );
    });
  }
}