abstract class Logger {
  Future<void> recordError(Exception exception, {StackTrace? stackTrace, String? reason, bool isFatal = false});
  Future<void> log(String message);
}