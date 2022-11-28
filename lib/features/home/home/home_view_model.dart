import 'home_view_controller.dart';

class HomeViewModel extends HomeProtocol {
  int _currentIndex = 0;

  @override
  int get currentIndex => _currentIndex;

  @override
  void didTapSelectedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
