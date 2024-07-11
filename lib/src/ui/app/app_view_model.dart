import 'package:flutter/material.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class AppViewModel extends ChangeNotifier {
  int _pageIndex = 0;

  bool _canPop = false;

  bool get canPop => _canPop;

  final List<int> _history = [0];

  int get pageIndex => _pageIndex;

  void changePage(int value) {
    final page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.UPLOAD:
      case Page.REELS:
      case Page.MYPAGE:
        changeIndex(page.index);
    }
  }

  void changeIndex(int value) {
    if (_history.last != value) {
      _history.add(value);
    }
    print(_history);
    _pageIndex = value;
    notifyListeners();
  }

  void back(bool didPop) {
    if (_history.length > 1) {
      _history.removeLast();
      _pageIndex = _history.last;
      notifyListeners();
    } else {
      _canPop = true;
      notifyListeners();
    }
  }
}
