import 'package:flutter/material.dart';
import 'package:tiktok_shashwat/constants.dart';
import 'package:tiktok_shashwat/views/screens/auth/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'TikTok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // A widget which will be started on application startup
      home: LoginScreen(),
    );
  }
}
