import 'package:flutter/material.dart';
import 'package:flutter_connectivity/app/internet_handler.dart';
import 'package:flutter_connectivity/app/no_internet_state.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, "/second"),
            child: Text("Second Screen"),
          ),
        ),
      ),
    );
  }
}
