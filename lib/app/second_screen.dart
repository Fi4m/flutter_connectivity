import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, "/third"),
            child: Text("Third Screen"),
          ),
        ),
      ),
    );
  }
}
