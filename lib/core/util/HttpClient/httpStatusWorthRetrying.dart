part of cleanArchitectureUtils;

class HttpStatusWorthRetying {
  static bool isWorthRetrying(int statusCode) {
    if (statusCode == HttpStatus.requestTimeout ||
        statusCode == HttpStatus.internalServerError ||
        statusCode == HttpStatus.badGateway ||
        statusCode == HttpStatus.serviceUnavailable ||
        statusCode == HttpStatus.gatewayTimeout) return true;
    return false;
  }
}
