import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings'),
        actions: [
          IconButton(
            onPressed: () {
              print('add new saving clicked');
            }, 
            icon: const Icon(Icons.add),
            tooltip: 'Add new saving',
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: const Column(
            children: [
              Text('Diagram'),
              SizedBox(height: 24.0),
              Text('Tabelka z danymi'),
              SizedBox(height: 24.0),
              Text('Doprecyzowanie czego jeszcze brakuje'),
            ],
          ),
        ),
      ),
    );
  } 
}