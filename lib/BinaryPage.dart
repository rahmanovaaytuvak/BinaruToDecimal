import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BinaryPage extends StatefulWidget {
  const BinaryPage({super.key});

  @override
  State<BinaryPage> createState() => _BinaryPageState();
}

class _BinaryPageState extends State<BinaryPage> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _binaryController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  void _conver() {
    String input = _inputController.text;
    if (RegExp(r'^[01]+$').hasMatch(input)) {
      try {
        int decimal = int.parse(input, radix: 2); // Binardan onluga geçir
        _decimalController.text = decimal.toString(); // Onluk netije
        _binaryController.text = input; // Girizilen binar maglumat
      } catch (e) {
        _decimalController.text = 'Invalid Input';
        _binaryController.text = 'Invalid Input';
      }
    }
    // Eger maglumat onluk bolsa, binara geçir
    else {
      try {
        int decimal = int.parse(input); // Onluk sany oka
        _decimalController.text = decimal.toString(); // Onluk sany görkez
        _binaryController.text = decimal.toRadixString(2); // Binara geçir
      } catch (e) {
        _decimalController.text = 'Invalid Input';
        _binaryController.text = 'Invalid Input';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binarydan decimala Decimaldan binara gecmek'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _inputController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'San giriz'),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                _conver();
              },
              child: Icon(Icons.swap_vert_circle),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _binaryController,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'binary'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _decimalController,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Decimal'),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    _binaryController.dispose();
    _decimalController.dispose();
  }
}
