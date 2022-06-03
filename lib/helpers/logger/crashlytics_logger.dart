import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';

class CrashlyticsLogger extends Logger {
  @override
  Future<void> recordError(Exception exception,
      {StackTrace? stackTrace, String? reason, bool isFatal = false}) async {
    await FirebaseCrashlytics.instance.recordError(
        exception, stackTrace ?? StackTrace.fromString(exception.toString()),
        reason: reason, fatal: isFatal);
  }

  @override
  Future<void> log(String message) async {
    await FirebaseCrashlytics.instance.log(message);
  }
}
