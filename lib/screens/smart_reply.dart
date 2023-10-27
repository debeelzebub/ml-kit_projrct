import 'package:flutter/material.dart';
import 'package:projectfirebase/data/data_source.dart';

class MySmartReply extends StatefulWidget {
  const MySmartReply({super.key});

  @override
  State<MySmartReply> createState() => _MySmartReplyState();
}

class _MySmartReplyState extends State<MySmartReply> {
   ImageDataSource data= ImageDataSource();
    List reply=[];
    bool val=false;
    final _tcon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
         toolbarHeight: 70,
        backgroundColor:const Color.fromARGB(255, 235, 235, 235),
        title:const Center(child:  Text("Smart Reply")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20,right: 20,left: 20),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
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
                  ),
                  hintText: "Write Here"
                  )
                ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                reply= await data.getsmartreply(_tcon.text);
                val=true;
                _tcon.clear();
                setState(() {
                  
                });
              }, 
              style:const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 50,
              vertical: 13))),
              child:const Text("submit",style: TextStyle(color: Colors.white,fontSize:18),)),
              const SizedBox(width: 10,),
             
              const SizedBox(height: 10,),
              val==true?
              SizedBox(
                height: MediaQuery.of(context).size.height/8,
                child:ListView.builder(
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
                })
              ):const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}