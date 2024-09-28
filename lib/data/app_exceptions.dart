class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([super.message]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message,"Invalid Request");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized Request");
}