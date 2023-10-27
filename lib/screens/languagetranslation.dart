import 'package:flutter/material.dart';
import 'package:projectfirebase/data/data_source.dart';
import 'package:projectfirebase/widget/functionbutton.dart';

class MyTranslation extends StatefulWidget {
  const MyTranslation({super.key});

  @override
  State<MyTranslation> createState() => _MyTranslationState();
}

class _MyTranslationState extends State<MyTranslation> {
    String dropdownValue="Select Language" ;
     ImageDataSource data=ImageDataSource();
    String result="";
    bool val=false;
    bool isColor=false;
    bool isColor1=false;
    final _tcon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor:const Color.fromARGB(255, 235, 235, 235),
          title:const Center(child: Text("Translation")),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20,right: 20,left: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _tcon,
                maxLines: 8,
                cursorColor: Colors.blue,
                decoration:const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color(0xFF0073E6))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color(0xFF0073E6))
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0073E6))
                  ),
                  hintText: 'Write Here',
                  )
                ),
              
              DropdownButton<String>(
                focusColor: Colors.blue,
                dropdownColor:const Color.fromARGB(255, 224, 225, 226) ,
          value: dropdownValue,
          elevation: 16,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Select Language','Tamil', 'Hindi', 'Japanese', 'German']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,textAlign: TextAlign.center,),
            );
          }).toList(),
        ),

              const SizedBox(height: 20,),
              Row(
                children: [
                  FunctionButton(text: "Translate", isSelect: true, 
                  onTap: ()async{
                    result="";
                    result= await data.texttranslate(_tcon.text,dropdownValue);
                    setState(() {
                      isColor=true;
                        isColor1=false;
                      if(result.isNotEmpty){
                        
                         val=true;
                      }
                    });
                  },
                  isColor:isColor ,),
                  const SizedBox(width: 7,),
                      FunctionButton(
                        text: "Clear Text",
                        isSelect: false,
                        isColor2: isColor1,
                        onTap:()async{
                         _tcon.clear();
                          setState(() {
                          isColor1=true;
                          isColor=false;
                          val=false;
                          });
                        },
                      ),
                ],
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(onPressed: ()async{
              //         result="";
              //         result= await data.texttranslate(_tcon.text,dropdownValue);
              //         setState(() {
              //           if(result.isNotEmpty){
              //           val=true;
              //           }
              //         });
              //       },
              //       style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),
              //       padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
              //         horizontal: 55,
              //         vertical: 14
              //       ))),
              //        child:const Text("Translate",style: TextStyle(color: Colors.white),)
              //        ),
              //     ),
              //     Expanded(
              //       child: ElevatedButton(onPressed: ()async{
              //         result="";
              //         _tcon.clear();
              //         setState(() {
              //           val=false;
              //         });
              //       },
              //       style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),
              //       padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
              //         horizontal: 55,
              //         vertical: 14
              //       ))),
              //        child:const Text("Clear Text",style: TextStyle(color: Colors.white),)
              //        ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10,),
              val==true?
              SizedBox(child: Card(
                color: const Color(0xFFF9F9F9),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                shadowColor:const Color(0x3F000000),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(result,style:const TextStyle(fontSize: 20),),
                )),):const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}