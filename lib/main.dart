import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void main() => runApp(RandomApp());

class RandomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  TextStyle text = TextStyle(fontSize: 30);
  int number = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Teacher helper'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}



