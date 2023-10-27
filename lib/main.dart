import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:projectfirebase/screens/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken =await FirebaseMessaging.instance.getToken();
  
  // ignore: avoid_print
  print(fcmToken);
  runApp(
   MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      // scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      useMaterial3: true
    ),
    home:const MyHomeai(),

  ));
}


// ignore: must_be_immutable
