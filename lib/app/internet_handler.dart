import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_connectivity/app/app.dart';

mixin InternetHandler on State<App> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivityListener;
  final DataConnectionChecker _dataConnectionChecker = DataConnectionChecker();
  StreamSubscription<DataConnectionStatus> _dataListener;

  StreamController<bool> isConnectedToInternet = StreamController();

  @override
  void initState() {
    super.initState();
    _connectivityListener = _connectivity.onConnectivityChanged
        .listen(_onConnectivityChangedListner);
  }

  @override
  void dispose() {
    _connectivityListener.cancel();
    _dataListener?.cancel();
    isConnectedToInternet.close();
    super.dispose();
  }

  _onConnectivityChangedListner(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      isConnectedToInternet.add(false);
    } else {
      final isConnected = await _dataConnectionChecker.hasConnection;
      isConnectedToInternet.add(isConnected);
      if (!isConnected) {
        _dataListener =
          _dataConnectionChecker.onStatusChange.listen(_onStatusChangeListener);
      }
    }
  }

  _onStatusChangeListener(DataConnectionStatus status) {
    isConnectedToInternet.add(status == DataConnectionStatus.connected);
    if (status == DataConnectionStatus.disconnected) {
      Future.delayed(Duration(seconds: 20), () => _dataConnectionChecker.hasConnection);
    }
  }
}
