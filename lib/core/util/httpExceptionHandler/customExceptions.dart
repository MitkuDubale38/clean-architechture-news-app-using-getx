class APIExceptions implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  APIExceptions([this.message, this.prefix, this.url]);
}

// 302
class FileMovedException extends APIExceptions {
  FileMovedException([String? message, String? url])
      : super('Resource has been moved to different location', url);
}

// 400
class BadRequestException extends APIExceptions {
  BadRequestException([String? message, String? url])
      : super('Bad request', url);
}

//401
class UnAuthorizedException extends APIExceptions {
  UnAuthorizedException([String? message, String? url])
      : super('Unauthorized ! Access Denied', url);
}

//403
class ForbiddenException extends APIExceptions {
  ForbiddenException([String? message, String? url])
      : super('You don not have permission to access this server', url);
}

//404
class NotFoundException extends APIExceptions {
  NotFoundException([String? message, String? url])
      : super('Oops! Page Error', url);
}

//410
class NoLongerAvailableException extends APIExceptions {
  NoLongerAvailableException([String? message, String? url])
      : super('Access to the target resource is no longer available', url);
}

//502
class BadGatewayException extends APIExceptions {
  BadGatewayException([String? message, String? url])
      : super(
            'The server encountered a temporary error and could not complete your request',
            url);
}

//505
class InternalServerError extends APIExceptions {
  InternalServerError([String? message, String? url])
      : super('Internal Server Error', url);
}

//408
class ConnectionTimedOutException extends APIExceptions {
  ConnectionTimedOutException([String? message, String? url])
      : super('Connection timed out ! Please Try again', url);
}

// DEFAULT
class FetchDataException extends APIExceptions {
  FetchDataException([String? message, String? url])
      : super('Unable to process the request', url);
}
