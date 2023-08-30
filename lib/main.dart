import 'package:flutter/material.dart';

import 'app.dart';

void main() {

  // Ensure initialized for async operation before runApp
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize all necessary port and databases ( local / global ) before starting the app.

  runApp(const App());
}
