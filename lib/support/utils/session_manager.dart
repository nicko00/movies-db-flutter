import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/user.dart';

abstract class SessionManagerProtocol{
  User? get user;
  bool get hasSession;
  Future<void> verifySession();
  Future<void> removeSession();
  Future<void> createSession(User user);
}

class SessionManager extends SessionManagerProtocol {
  final _user = ValueNotifier<User?>(null);
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static final SessionManagerProtocol instance = SessionManager._();

  SessionManager._();

  @override
  User? get user => _user.value;

  @override
  bool get hasSession => _user.value != null;

  @override
  Future<void> verifySession() async {
    final user = await _secureStorage.readAll();

    if (user['name'] == null) return;

    _user.value = User.fromMap({
      'name': user['name'],
      'favorites': user['favorites'],
    });
  }

  @override
  Future<void> removeSession() async {
    _user.value = null;
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> createSession(User user) async {
    _user.value = user;

    user.toMap().forEach((key, value) async {
      await _secureStorage.write(key: key, value: value);
    });
  }
}
