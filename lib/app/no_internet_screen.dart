import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("No internet connection", style: TextStyle(fontSize: 17)),
            FlatButton(
              onPressed: () => Connectivity().checkConnectivity(),
              child: Text("Retry", style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}