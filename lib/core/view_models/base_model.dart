import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _isBusy = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool get isBusy => _isBusy;

  setBusy([bool busy = true]) {
    _isBusy = busy;
    notifyListeners();
  }
}
