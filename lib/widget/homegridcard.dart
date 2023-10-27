import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeGridCard extends StatefulWidget {
  final Color? color;
  final Icon? icon;
  final String text;
  final VoidCallback onTap;
  const HomeGridCard({super.key,required this.color,required this.icon,required this.text,required this.onTap});

  @override
  State<HomeGridCard> createState() => _HomeGridCardState();
}

class _HomeGridCardState extends State<HomeGridCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12),
        child: SizedBox(
          child: Column(
            children: [
              Stack(
                children: [                
                  Container(
                    height: 80.57,
                    width: 80.57,
                    decoration: ShapeDecoration(
                      color:widget.color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                    ),
                     child:widget.icon,
                  ),
                Positioned(
                    right:48,
                    bottom:48,
                    child:CircleAvatar(
                      radius:30,
                      backgroundColor: Colors.white.withOpacity(0.20999999344348907),
                    )
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Text(widget.text,softWrap: true,textAlign:TextAlign.center,style: GoogleFonts.poppins(
                textStyle:const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1B1B1F),
                ),),
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}