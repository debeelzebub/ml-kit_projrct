import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectfirebase/widget/homecoyright.dart';
import 'package:projectfirebase/widget/homegrid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomeai extends StatefulWidget {
  const MyHomeai({super.key});

  @override
  State<MyHomeai> createState() => _MyHomeaiState();
}

class _MyHomeaiState extends State<MyHomeai> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
        preferredSize:const Size.fromHeight(70),
        child: Container(
          decoration:const BoxDecoration(
            color: Color(0xFFF8F7F5),
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
            title: Row(
              children: [
                 Builder(builder: (BuildContext context) {
             return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
             }, icon: SvgPicture.asset("assets/icons/dash.svg"));
           }),
                Image.asset("assets/image/Group30810.png",width:73,height: 28,),
              ],
            ),
            actions: [
              Row(
                children: [
                  Container(
                    width: 90.55,
                    height: 49,
                    decoration: ShapeDecoration(
                      color:const Color(0xFF0073E6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34))),
                    
                    child: Center(child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Text("Login",style: GoogleFonts.inter(
                          textStyle:const TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                          ),),
                          const SizedBox(height: 5,)
                      ],
                    )),
                  ),
                 const SizedBox(width: 20,)
                ],
              )
            ],
          ),
        ),
      ),
      drawer:const Drawer(),
      body:SizedBox(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.only(top:40,left:10,right: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  Center(child: Text("Every app in one place",
                    style: GoogleFonts.inter(
                      textStyle:const TextStyle(
                        color:Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600
                      )
                    ),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Expanded(
                    child: HomeGrid()
                  ),
                ],
              ),
      
              Positioned(
                top: h/1.42,
                left: w/6.45,
                child: Column(
                  children: [
                    Text("Copyright @interns2023 all rights reserved ",
                      style:GoogleFonts.inter(
                        textStyle:const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight:FontWeight.w400
                        )
                      ),
                    ),
                    const SizedBox(height:15,),
                    const Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaaIcon(icon: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,size: 19)),
                        FaaIcon(icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 19)),
                        FaaIcon(icon: FaIcon(FontAwesomeIcons.facebookF,color: Colors.white,size: 15,)),
                        FaaIcon(icon: FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 19)),
                        
                      
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ) ,
    );
  }
}