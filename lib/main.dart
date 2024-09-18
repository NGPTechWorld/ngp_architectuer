import 'package:flutter/material.dart';
import 'package:ngp_architectuer/app/app.dart';
import 'package:ngp_architectuer/app/core/binding/app_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBinding().dependencies();
  await AppBinding().initializes();
  runApp(const App());
}
