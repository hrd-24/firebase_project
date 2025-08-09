import 'package:logger/logger.dart';

var logger = Logger(
  filter: null,
  output: null,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    levelColors: {
      Level.debug: const AnsiColor.fg(32), //oncreate
      Level.trace: const AnsiColor.fg(25), //onclose
      Level.info: const AnsiColor.fg(40), //onchange
      Level.warning: const AnsiColor.fg(33), // Use the color code for yellow
      Level.error: const AnsiColor.fg(31), // onerror
      // Level.wtf: const AnsiColor.fg(35),
    },
    printEmojis: true,
  ),
);
