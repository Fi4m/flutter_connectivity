import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class InternetCheckerState<T extends StatefulWidget> extends State<T> {

  final Connectivity connectivity = Connectivity();
  final DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    subscription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        Navigator.popUntil(context, (route) {

        });
        // if (ModalRoute.of(context).settings.name == widget.rou)
        Navigator.pushNamed(context, "/noInternet");
      } else {
        _checkConnection();
      }
    });
  }

  _checkConnection() async {
        if (await dataConnectionChecker.hasConnection) {
          print(ModalRoute.of(context).settings.name);
        } else {
          print(ModalRoute.of(context).settings.name);
          Navigator.pushNamed(context, "/noInternet");
        }
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  // _showNoInternetConnection() => showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //           title: Text("Internet Checker"),
  //           content: Text("Internet not connected"),
  //           actions: <Widget>[
  //             FlatButton(
  //                 child: Text("Retry"),
  //                 onPressed: () {
  //                   connectivity.checkConnectivity();
  //                 }),
  //           ],
  //         ));
}
