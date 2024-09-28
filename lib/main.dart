import 'package:care_mingle/app.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await initializeDependencies();
  await Hive.initFlutter();
  runApp(const App());
}

