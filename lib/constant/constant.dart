import 'dart:io';

class Constant {
  static String apiMainUrl =
      Platform.isAndroid ? 'http://10.0.2.2:4000' : 'http://localhost:4000';
}
