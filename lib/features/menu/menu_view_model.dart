import 'menu_view_controller.dart';

class MenuViewModel extends MenuProtocol {
  @override
  void didTapProfile() {
    onTapProfile?.call();
  }
}
