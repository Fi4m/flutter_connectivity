import 'package:flutter/material.dart';
import 'package:flutter_connectivity/app/first_screen.dart';
import 'package:flutter_connectivity/app/internet_handler.dart';
import 'package:flutter_connectivity/app/no_internet_screen.dart';
import 'package:flutter_connectivity/app/second_screen.dart';
import 'package:flutter_connectivity/app/third_screen.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with InternetHandler {
  BuildContext buildContext;

  @override
  void initState() {
    super.initState();

    isConnectedToInternet.stream.listen((isConnectedToInternet) {
      if (isConnectedToInternet) {
        Navigator.popUntil(buildContext, (Route<dynamic> route) {
          return route.settings.name != "/noInternet";
        });
      } else {
        Navigator.pushNamedAndRemoveUntil(buildContext, "/noInternet", (Route<dynamic> route) {
          return route.settings.name != "/noInternet";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Connectivity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
    );
  }

  Map<String, WidgetBuilder> get _routes => {
    "/": (context) => _saveContext(context, FirstScreen()),
    "/second": (context) => _saveContext(context, SecondScreen()),
    "/third": (context) => _saveContext(context, ThirdScreen()),
    "/noInternet": (context) => NoInternetScreen()
  };

  Widget _saveContext(BuildContext context, Widget widget) {
    buildContext = context;
    return widget;
  }
}