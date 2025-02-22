import 'package:flutter/material.dart';
import 'package:tissue_land/screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Pretandard-Medium'),  // 테마에 폰트 설정
      // home: const SplashScreen(),
      home: HomeScreen(),
    );
  }
}

