import 'package:provider_test/base_view_model.dart';

class ViewModel extends BaseViewModel {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void updateState() {
    this.viewState = ViewState.done;
    notifyListeners();
  }
}
