import 'package:flutter/material.dart';
import 'package:login/pages/profile.dart';
import 'package:login/pages/splash.dart';
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
