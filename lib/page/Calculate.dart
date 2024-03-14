import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController _controllerA = TextEditingController();
  TextEditingController _controllerB = TextEditingController();
  String result = '';

  void calculateEquation() {
    double a = double.tryParse(_controllerA.text) ?? 0;
    double b = double.tryParse(_controllerB.text) ?? 0;

    if (a == 0) {
      setState(() {
        result = "The equation is not a linear equation!!";
      });
    } else {
      double x = -b / a;
      if (b == 0) {
        setState(() {
          result = "The solution of the equation is x = 0";
        });
      } else {
        setState(() {
          result = "The solution of the equation is x = $x";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '-CALCULATOR-',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input a:'),
            ),
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Input b:'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateEquation,
              child: Text(
                'Calculate',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Đặt màu nền là màu xanh
              ),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
