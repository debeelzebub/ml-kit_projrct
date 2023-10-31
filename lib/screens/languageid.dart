
import 'package:flutter/material.dart';
import 'package:projectfirebase/data/data_source.dart';
import 'package:projectfirebase/data/listclass.dart';
import 'package:projectfirebase/widget/functionbutton.dart';

class LanguageDetector extends StatefulWidget {
  const LanguageDetector({super.key});

  @override
  State<LanguageDetector> createState() => _LanguageDetectorState();
}

class _LanguageDetectorState extends State<LanguageDetector> {
  String result = '';
  String result1 = '';
  bool isClicked = false;
  bool isPressed1 = true;
  List<Product> list = [];
  ImageDataSource data1 = ImageDataSource();  
  final _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language Detection',
          style:  TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: _control,
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
                  hintText: 'Type here',
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 190,
                child: FunctionButton(text: "Language detection", isSelect: true,isColor: isPressed1, 
                onTap: ()async{
                     list = await data1.detectLanguage(_control.text);
                  setState(() {
                    isClicked = true;
                  });
                }),
              ),
             
              const SizedBox(height: 25),
              const SizedBox(width: 20),
              isClicked == true
                  ? ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(
                                248, 161, 144, 144),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(25, 0, 0, 0),
                              blurRadius: 1,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text('Langauge ID :'),
                                ),
                                const SizedBox(width: 40),
                                Text('${list[index].text}'),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left:15),
                                  child: Text('Confidence   :'),
                                ),
                                const SizedBox(width: 40),
                                Text('${list[index].confi}'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}