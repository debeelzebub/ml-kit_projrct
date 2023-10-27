import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaaIcon extends StatelessWidget {
  final FaIcon? icon;
  const FaaIcon({super.key,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.black,
          child: icon,
        ),
       const SizedBox(width:17,)
      ],
    );
  }
}