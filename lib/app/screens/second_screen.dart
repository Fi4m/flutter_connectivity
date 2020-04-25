import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
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
            child: Text("Third Screen >"),
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}