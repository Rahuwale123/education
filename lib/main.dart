import 'package:flutter/material.dart';
import 'package:login/pages/splash.dart';
import 'package:login/pages/videoplay.dart';
void main(){
  runApp(app());
}
class app extends StatelessWidget {
  const app({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Education',
      home: Splash(),
    );
  }
}
