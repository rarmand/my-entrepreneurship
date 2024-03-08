import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App title")),
      body: const Center(child: Text('Starting view right after loggin in or entering the app'),)
    );
  } 
}