import 'package:flutter/material.dart';

enum ViewState { loadding, done, error }

class BaseViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.loadding;

  bool _dispose = false;

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }
}
