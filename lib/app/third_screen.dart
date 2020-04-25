import 'package:flutter/material.dart';
import 'package:flutter_connectivity/app/no_internet_state.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Third Screen"),
        ),
        body: Container(color: Colors.blue));
  }
}
