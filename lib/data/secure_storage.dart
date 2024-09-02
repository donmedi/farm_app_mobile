import 'package:farm_loan_app/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = const FlutterSecureStorage();

Future saveUser(String key, String value) async =>
    await storage.write(key: key, value: value);

Future<String> readUser(key) async => await storage.read(key: key) ?? '';

// Future saveStorageData(String key, String value) async =>
//     await storage.write(key: key, value: value);
Future clearAllData() async => await storage.deleteAll();

Future clearHiveBox() async => await box.clear();

Future<void> clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
// Future<String> readStorageData(key) async => await storage.read(key: key) ?? '';