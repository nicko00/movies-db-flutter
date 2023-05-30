import 'dart:async';

import 'package:flutter_gen/gen_l10n/localize.dart';
import '../../../models/user.dart';
import '../../utils/session_manager.dart';
import 'create_user_bottom_sheet.dart';

class CreateUserBottomSheetViewModel extends CreateUserBottomSheetViewModelProtocol {
  String _text = '';
  String? _errorMessage;
  bool _isLoading = false;

  final Localization l10n;
  final SessionManagerProtocol sessionManager;

  CreateUserBottomSheetViewModel({required this.l10n, required this.sessionManager});

  @override
  String? get errorMessage => _errorMessage;

  @override
  bool get isDisabled => _text.isEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  void didChangeUsername(String text) {
    _errorMessage = null;
    _text = text;
    notifyListeners();
  }

  @override
  void didTapCreate() {
    if (_text.length < 4) {
      _errorMessage = 'O nome de usuário deve ter 4 ou mais caracteres';
      notifyListeners();
      return;
    }

    _setLoading(true);

    Timer(const Duration(milliseconds: 2000), (){
      try {
        sessionManager.createSession(User.fromMap({
          'name': _text,
          'favorites': null,
        })).whenComplete(() {
          onCreateUser?.call();
        });
      } on Error catch (_) {
        _errorMessage = 'Ops! Algo deu errado. Por favor, tente novamente';
        _setLoading(false);
      }
    });
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
