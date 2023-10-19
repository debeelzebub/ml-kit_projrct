import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:path/path.dart' as path;
import 'package:projectfirebase/data/data_source.dart';
import 'package:projectfirebase/data/listclass.dart';
import 'package:projectfirebase/screens/detectdata.dart';
import 'package:projectfirebase/screens/labeldata.dart';
import 'package:projectfirebase/screens/smart_reply.dart';
import 'package:projectfirebase/widget/button_upload.dart';
import 'package:projectfirebase/widget/functionbutton.dart';
import 'package:projectfirebase/widget/page1.dart';
import 'package:projectfirebase/widget/viewimage.dart';

class ImageLabeling extends StatefulWidget {
  const ImageLabeling({super.key});

  @override
  State<ImageLabeling> createState() => _ImageLabelingState();
}

class _ImageLabelingState extends State<ImageLabeling> {
   XFile? imageFile;
    ImageDataSource data = ImageDataSource();
    String result = "";
    bool imlabel=false;
    bool isColor=false;
    bool isColor1=false;
    List<Product>list=[];
    
  @override
  void initState() {
    super.initState();
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor:const Color.fromARGB(255, 235, 235, 235),
        title: Center(child: Image.asset("assets/image/Group 30797.png")),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: imageFile!=null?
            Column(         //2nd page
              children: [
                const SizedBox(height: 10,),
                MyButton(
                  title: "Another Image",
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

                MyImage(imageFile: imageFile!,
                onTap:()async{
                  list=[];
                  list=await data.getbarcode(imageFile!);
                  imlabel=true;
                  setState(() {
                    isColor=false;
                    isColor1=false;
                  });
                } ,),

                const SizedBox(height: 20,),
                Text("choose a function",
                  style: GoogleFonts.poppins(
                    textStyle:const TextStyle(fontSize: 14)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15,left:15,top: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FunctionButton(
                        text:"Image Label",
                        isSelect: true,
                        isColor:isColor,
                        onTap:()async{
                          list=await data.getImagelabel(imageFile!);
                          // list=await data.getbarcode(imageFile!);
                          setState(() {
                          isColor=true;
                          isColor1=false;
                          imlabel=true;
                          });
                        } ,
                      ),
                      const SizedBox(width: 7,),
                      FunctionButton(
                        text: "Object Detect",
                        isSelect: false,
                        isColor2: isColor1,
                        onTap:()async{
                         list=await data.getobjectdetect(imageFile!);
                          setState(() {
                          isColor1=true;
                          isColor=false;
                          imlabel=true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                imlabel==true?                // when get data
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
                      child:SizedBox(
                        // height:MediaQuery.of(context).size.height/2,
                      
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            return isColor==true?
                            MyLabel(label:"${list[index].text}",isSelect: false,): isColor1==true?
                            MyDetectdata(label: "${list[index].text}", confi: "${list[index].confi}"):
                            MyLabel(label: "${list[index].text}", isSelect:true);
                          }
                        ),
                      )
                    ),
                  ],
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
                        title: "Take a Photo ",
                        onTap: ()=>showbottomsheet(context)
                      ),
                      const SizedBox(height: 20,),
                      Text("No image selected",style: GoogleFonts.poppins(textStyle:const TextStyle(fontWeight: FontWeight.w300)),),
                      const SizedBox(height: 20,),
                      MyButton(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MySmartReply()));}, 
                      title: "Smart Reply")
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