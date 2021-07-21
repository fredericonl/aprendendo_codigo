import 'package:flutter/material.dart';

class PageManager {
  PageManager(this._pageController);

  PageController _pageController;
  int page = 0;

  void setPage(int value) {
    if (page == value) return;
    page = value;
    _pageController.jumpToPage(value);
  }
}
