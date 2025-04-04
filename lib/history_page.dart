import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> calculationHistory;

  const HistoryPage({required this.calculationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation History'),
      ),
      body: calculationHistory.isEmpty
          ? const Center(
              child: Text(
                'No history available',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: calculationHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(calculationHistory[index]),
                );
              },
            ),
    );
  }
}
