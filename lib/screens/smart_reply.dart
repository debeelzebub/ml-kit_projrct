import 'package:flutter/material.dart';
import 'package:projectfirebase/data/data_source.dart';
import 'package:projectfirebase/widget/button_upload.dart';

class MySmartReply extends StatefulWidget {
  const MySmartReply({super.key});

  @override
  State<MySmartReply> createState() => _MySmartReplyState();
}

class _MySmartReplyState extends State<MySmartReply> {
   ImageDataSource data= ImageDataSource();

    List reply=[];
    String result="";
    bool val=false;
    bool show=false;
   final _tcon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 70,
        backgroundColor:const Color.fromARGB(255, 235, 235, 235),
        title:const Text("Smart Reply"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20,right: 20,left: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _tcon,
                decoration:const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color(0xFF0073E6))
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  Color(0xFF0073E6))
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0073E6))
                  )
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child:ElevatedButton(onPressed: ()async{
                      result="";
                      reply= await data.getsmartreply(_tcon.text);
                      val=true;
                      show=false;
                      setState(() {
                        
                      });
                    }, 
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child:const Text("submit",style: TextStyle(color: Colors.white),))
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(onPressed: ()async{
                      result="";
                      result= await data.texttranslate(_tcon.text);
                      val=true;
                      show=true;
                      setState(() {
                        
                      });
                    },
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                     child: Text("Translate",style: TextStyle(color: Colors.white),))
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              val==true?
              SizedBox(
                height: MediaQuery.of(context).size.height/8,
                child:show==false? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: reply.length,
                  itemBuilder: (context,index){
                  return Card(
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border:Border.all(color: Colors.blue)
                      ),
                      child: Center(child: Text("${reply[index]}",style:const TextStyle(fontSize: 20),)),
                    ),
                  );
                }):SizedBox(child: Text(result,style: TextStyle(fontSize: 20),),)
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}