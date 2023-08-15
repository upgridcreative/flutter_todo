abstract class NetworkException implements Exception {
  final String prefix;
  final String message;
  final String code;
  NetworkException(
      {this.prefix = "Error",
      this.message = "Unknown Error",
      required this.code});

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class NoInternetException extends NetworkException {
  NoInternetException()
      : super(
          prefix: "No Internet",
          message: "Please check your internet connection",
          code: '1',
        );
}

class FetchDataException extends NetworkException {
  FetchDataException(String message)
      : super(
          prefix: "Error During Communication",
          message: message,
          code: '1',
        );
}

class BadRequestException extends NetworkException {
  BadRequestException(String message, String code)
      : super(prefix: "Invalid Request", message: message, code: code);
}

class ThrottleRequestException extends NetworkException {
  ThrottleRequestException()
      : super(
            prefix: "Invalid Request",
            message: 'Too many requests',
            code: 'qouta-exceded');
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException(String message)
      : super(
          prefix: "Unauthorised Request",
          message: message,
          code: 'no-valid-token',
        );
}

