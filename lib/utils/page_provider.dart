
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void selectPage(int page) {
    _pageIndex = page;
    notifyListeners();
  }

}