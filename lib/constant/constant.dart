import 'dart:io';

class Constant {
  static String apiMainUrl = Platform.version == 'ios'
      ? 'http://localhost:4000'
      : 'http://127.0.0.1:4000';
}
