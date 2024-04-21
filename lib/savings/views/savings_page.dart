import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int touchedIndex = 0;

    // TODO: do pobrania z bazy danych
    const double freeCapital = 2000.0;
    const String currency = 'PLN';

    // TODO: do pobrania z bazy danych
    // do połączenia z klasą investment z constants
    final data = [
      {'name': 'obligacje', 'value': 10000.0, 'color': Colors.cyan},
      {'name': 'lokaty', 'value': 30000.0, 'color': Colors.deepOrange},
      {'name': 'akcje', 'value': 5000.0, 'color': Colors.blueGrey},
      {'name': 'kryptowaluty', 'value': 15000.0, 'color': Colors.lightGreen},
    ];

    List<PieChartSectionData> generateSections() {
      return data.map((obj) {
        return PieChartSectionData(
          title: obj['name'].toString().toUpperCase(),
          titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          color: obj['color'] as Color,
          value: obj['value'] as double,
        );
      }).toList();
    }

    PieChartData pieChartData = PieChartData(
      startDegreeOffset: 0,
      centerSpaceRadius: double.infinity,
      sectionsSpace: 4.0,
      sections: generateSections(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings'),
        centerTitle: true,
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
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0), 
                child: Column(
                  children: [
                    Text(
                      'Free capital',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '$freeCapital $currency',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ), 
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24.0),

              SizedBox(
                width: 300,
                height: 300,
                child: PieChart(
                  pieChartData,
                  swapAnimationDuration: const Duration(milliseconds: 150),
                  swapAnimationCurve: Curves.linear,
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