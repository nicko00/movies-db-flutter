import '../../support/utils/cache_manager.dart';
import '../../support/utils/constants.dart';
import 'settings_view_controller.dart';

class SettingsViewModel extends SettingsProtocol {
  bool _isMatureContentActive = false;
  bool _isLoading = false;

  final CacheManagerProtocol sharedPreferences;

  SettingsViewModel({required this.sharedPreferences});

  @override
  bool get isMatureContentActive => _isMatureContentActive;

  @override
  bool get isLoading => _isLoading;

  @override
  void didTapToggleMatureContent(bool value) {
    _updateCachedMatureValue(value);
  }

  @override
  void getSettingsValues() {
    _setLoading(true);
    _getCachedMatureValue();
  }

  void _updateCachedMatureValue(bool isActive) {
    _isMatureContentActive = isActive;
    sharedPreferences.setBool(
      key: Constants.isMatureActiveKey,
      value: isActive,
    );
    notifyListeners();
  }

  void _getCachedMatureValue() {
    final isMatureActive = sharedPreferences.getBool(Constants.isMatureActiveKey);
    _setMatureValue(isMatureActive);
  }

  void _setMatureValue(bool isActive) {
    _isMatureContentActive = isActive;
    _isLoading = false;
    notifyListeners();
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
