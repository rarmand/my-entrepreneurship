import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PieChartData data = PieChartData(
      centerSpaceRadius: 24.0,
      sectionsSpace: 1,
      sections: <PieChartSectionData>[
        PieChartSectionData(
          title: 'Obligacje skarbowe',
          value: 10000,
          color: Colors.yellow,
        ),
        PieChartSectionData(
          title: 'Lokata',
          value: 30000,
          color: Colors.green,
        ),
        PieChartSectionData(
          title: 'Kryptowaluty',
          value: 5000,
          color: Colors.blue,
        ),
        PieChartSectionData(
          title: 'Akcje giełdowe',
          value: 6000,
          color: Colors.red,
        ),
      ],
    );

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
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    data,
                    swapAnimationDuration: const Duration(milliseconds: 150),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              
              // TODO: list of indicators?

              const SizedBox(height: 24.0),
              const Text('Tabelka z danymi'),
              const SizedBox(height: 24.0),
              const Text('Doprecyzowanie czego jeszcze brakuje'),
            ],
          ),
        ),
      ),
    );
  } 
}