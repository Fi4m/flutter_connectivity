import 'package:flutter/material.dart';
import 'package:flutter_connectivity/app/internet_handler.dart';
import 'package:flutter_connectivity/app/screens/first_screen.dart';
import 'package:flutter_connectivity/app/screens/no_internet_screen.dart';
import 'package:flutter_connectivity/app/screens/second_screen.dart';
import 'package:flutter_connectivity/app/screens/third_screen.dart';

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

    isConnectedToInternet.stream.listen(_handleInternetConnection);
  }

  void _handleInternetConnection(isConnectedToInternet) {
    if (isConnectedToInternet) {
      Navigator.popUntil(buildContext, (Route<dynamic> route) {
        return route.settings.name != "/noInternet";
      });
    } else {
      Navigator.pushNamedAndRemoveUntil(buildContext, "/noInternet",
          (Route<dynamic> route) {
        return route.settings.name != "/noInternet";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Connectivity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        this.buildContext = context;
        return FirstScreen();
      }),
      routes: _routes,
    );
  }

  Map<String, WidgetBuilder> get _routes => {
        "/second": (context) => SecondScreen(),
        "/third": (context) => ThirdScreen(),
        "/noInternet": (context) => NoInternetScreen()
      };
}
