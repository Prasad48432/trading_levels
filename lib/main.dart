import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Utils',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Trading Tools',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(context, 'Calculator', Icons.leaderboard,
                const CalculatorPage()),
            _buildCard(
                context, 'History', Icons.history, const CalculatorPage()),
            _buildCard(
                context, 'Settings', Icons.settings, const CalculatorPage()),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  double? _firstBoxValue;
  double? _secondBoxValue;
  double? _thirdBoxValue;
  double? _fourthBoxValue;

  void _updateValues(String value) {
    double? input = double.tryParse(value);
    if (input != null) {
      double first = input * 1.01;
      double second = (first * 1.01) * 1.018;
      double third = (second * 1.01) * 1.028;
      double fourth = (third * 1.01) * 1.038;

      setState(() {
        _firstBoxValue = first;
        _secondBoxValue = second;
        _thirdBoxValue = third;
        _fourthBoxValue = fourth;
      });
    } else {
      setState(() {
        _firstBoxValue = null;
        _secondBoxValue = null;
        _thirdBoxValue = null;
        _fourthBoxValue = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trading Levels'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
                onChanged: _updateValues,
              ),
              const SizedBox(height: 20),
              _buildBox('1% Added', _firstBoxValue),
              _buildBox('0.18% Added', _secondBoxValue),
              _buildBox('0.28% Added', _thirdBoxValue),
              _buildBox('0.38% Added', _fourthBoxValue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox(String label, double? value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value != null ? value.toStringAsFixed(2) : '--',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
