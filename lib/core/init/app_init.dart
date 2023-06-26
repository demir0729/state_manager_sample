import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationInit {
  ApplicationInit._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown]);
  }
}
