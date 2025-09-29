class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'NO INTERNET CONNECTION');
}
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, '');
}
class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message]) : super(message, '');
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}