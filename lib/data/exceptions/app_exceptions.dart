class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() => '$_message$_prefix';
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
    : super(message, 'No Internet Connection');
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
    : super(message, "You don't have access to this");
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? message])
    : super(message, 'Request Time out');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, '');
}
