import 'package:flutter/material.dart';
import 'package:projectfirebase/data/gridlist.dart';
import 'package:projectfirebase/screens/barcodescan.dart';
import 'package:projectfirebase/screens/image_label.dart';
import 'package:projectfirebase/screens/languagetranslation.dart';
import 'package:projectfirebase/screens/objectdetect.dart';
import 'package:projectfirebase/screens/smart_reply.dart';
import 'package:projectfirebase/widget/homegridcard.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing:10,
        crossAxisSpacing:10,
        childAspectRatio:0.88
        ),
        itemCount:list.length , 
     itemBuilder: (context, index) {
       
     return 
      HomeGridCard(color:list[index].color,icon:list[index].icon,text:"${list[index].text}",
      onTap: () {
        switch(index){
          case 0:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BarcodeScani()));
              break;
          case 1:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyTranslation()));
              break;
          case 2:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLabeling()));
              break;
          case 3:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLabeling()));
              break;
          case 4:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ObjectDectecting()));
              break;
          case 5:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MySmartReply()));
              break;
          case 6:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLabeling()));
              break;
          case 7:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLabeling()));
              break;
          case 8:
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLabeling()));
              break;          
          default:
              break;
        }
      },
      );    
     }
    );
  }
}