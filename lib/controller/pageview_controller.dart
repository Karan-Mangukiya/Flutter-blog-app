import 'package:flutter/cupertino.dart';

final PageController pageController = PageController(
  initialPage: 0,
);

class PageViewController extends ChangeNotifier {
  int currentPage = 0;

  void setCurrentPage(int val) {
    currentPage = val;
    notifyListeners();
  }
}
