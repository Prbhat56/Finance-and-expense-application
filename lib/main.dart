import 'package:finanace_and_expense_app/app.dart';
import 'package:finanace_and_expense_app/init.dart' as HiveService;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Initialize Hive
  await HiveService.init();
  
  runApp(const App());
}