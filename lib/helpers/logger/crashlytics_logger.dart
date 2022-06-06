import 'package:zorro_sign_contacts/helpers/logger/logger.dart';

class CrashlyticsLogger extends Logger {
  @override
  Future<void> log(String message) async {
    print(message);
  }

  @override
  Future<void> recordError(Exception exception,
      {StackTrace? stackTrace, String? reason, bool isFatal = false}) async {
    print(reason);
  }
}
