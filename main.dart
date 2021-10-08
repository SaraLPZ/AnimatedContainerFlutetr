import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width = 100.0;
  double _heigth = 100.0;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(10);

  void _cambiarContainer() {
    final random = Random();

    _width = random.nextInt(350).toDouble();
    _heigth = random.nextInt(350).toDouble();
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(20).toDouble());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInSine,
                  width: _width,
                  height: _heigth,
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: _borderRadius,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _cambiarContainer, child: Text("Cambiar Container"))
          ],
        ),
      ),
    );
  }
}
