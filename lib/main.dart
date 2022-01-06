import 'package:flutter/material.dart';
import 'package:test_kelas_pintar_mobile/pages/camera_page.dart';
import 'package:test_kelas_pintar_mobile/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (context) => MainPage(),
        '/camera': (context) => CameraPage(),
      },
    );
  }
}
