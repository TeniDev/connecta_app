import 'package:logger/logger.dart';

final logger = _LoggerEvents();

class _LoggerEvents {
  final _loggerInstance = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  void debug(dynamic message) {
    _loggerInstance.d(message);
  }

  void error(dynamic message) {
    _loggerInstance.e(message);
  }

  void info(dynamic message) {
    _loggerInstance.i(message);
  }
}
