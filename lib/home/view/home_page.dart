import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: const Column(
            children: [
              Text('Najblizsze zadania i wydarzenia'),
              SizedBox(height: 24.0),
              Text('Doprecyzowanie czego jeszcze brakuje'),
            ],
          ),
        ),
      ),
    );
  } 
}