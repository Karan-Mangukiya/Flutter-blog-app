import 'package:flutter/cupertino.dart';

class AppDrawerController extends ChangeNotifier {
  int grpValue = 1;

  void selectedValue(val) {
    grpValue = val;
    notifyListeners();
  }
}
