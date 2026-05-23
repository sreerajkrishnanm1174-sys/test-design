import 'package:facebook_design_clone/Screens/main_screen.dart';
import 'package:facebook_design_clone/core/models/role.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: MainScreen(role:UserRole.admin),
    );
  }
}