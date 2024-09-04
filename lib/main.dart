import 'package:care_mingle/app.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:flutter/material.dart';

void main() async{
  await initializeDependencies();
  runApp(const App());
}

