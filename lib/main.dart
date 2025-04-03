import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading Levels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Trading Levels'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/trading.jpg',
                  height: 200,
                  width: double.infinity, // Ensure proper aspect ratio
                  fit: BoxFit
                      .cover, // Crop and fit image inside the rounded container
                ),
              ),
              const SizedBox(height: 20),
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
              _buildBox('Original', _thirdBoxValue),
              _buildBox('Original', _fourthBoxValue),
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
