import 'package:flutter/material.dart';
import 'package:trading_levels/caluculator_page.dart';
import 'package:trading_levels/history_page.dart';
import 'package:trading_levels/settings_page.dart';

void main() {
  runApp(const MyApp());
}

List<String> calculationHistory = [
  "5 + 3 = 8",
  "12 × 4 = 48",
  "15 - 7 = 8",
  "9 ÷ 3 = 3",
  "20 + 25 = 45",
  "50 ÷ 2 = 25",
  "100 - 35 = 65",
  "8 × 7 = 56",
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Utils',
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Trading Tools',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCard(
                context, 'Levels', Icons.leaderboard, const CalculatorPage()),
            _buildCard(
                context,
                'History',
                Icons.history,
                HistoryPage(
                  calculationHistory: calculationHistory,
                )),
            _buildCard(
                context, 'Settings', Icons.settings, const SettingsPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 100, color: Colors.deepPurple),
              const SizedBox(width: 10),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
