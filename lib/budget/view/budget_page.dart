import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget'),
        actions: [
          IconButton(
            onPressed: () {
              print('add new clicked');
            }, 
            icon: const Icon(Icons.add),
            tooltip: 'Add new budget element',
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