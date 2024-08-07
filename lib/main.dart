import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Services/bindings.dart';

import 'views/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // IinitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: false,
      ),
      initialBinding: IinitialBindings(),
      home: const MainScreen(),
    );
  }
}
