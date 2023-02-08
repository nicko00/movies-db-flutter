import 'package:dio/dio.dart';

import '../../localization/localize.dart';

class ServerError {
  final String? _error;
  final List<String>? _errors;

  ServerError({String? error, List<String>? errors})
      : _error = error,
        _errors = errors;

  ServerError.fromMap(Map<String, dynamic> map)
      : _error = map['error'],
        _errors = List<String>.from(map['errors']?.map((error) => error as String) ?? []);

  String get description {
    return _error ?? _errors?.join(', ') ?? Localize.instance.l10n.serverErrorRequestError;
  }
}

extension DioErrorExtension on DioError {
  static final _l10n = Localize.instance.l10n;

  ServerError asServerError() {
    try {
      final serverError = ServerError.fromMap(response?.data['data']);
      return serverError;
    } on TypeError catch (error) {
      return error.internalError();
    } on Error {
      return mapToServerError();
    }
  }

  ServerError mapToServerError() {
    final error = this;

    if (error.type == DioErrorType.connectTimeout) {
      return ServerError(error: _l10n.serverErrorTimeoutError);
    }

    return ServerError(error: _l10n.serverErrorRequestError);
  }
}

extension ErrorExtension on Error {
  static final _l10n = Localize.instance.l10n;

  ServerError internalError() {
    if (this is TypeError) {
      return ServerError(error: _l10n.serverErrorMappingFailureError);
    }

    return ServerError(error: _l10n.serverErrorRequestError);
  }
}

