import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/binarypage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BinaryPage(),);
  }
}
