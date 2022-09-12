import 'package:flutter/material.dart';
import 'bottom_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TATSUJIN GUILD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => BottomTab(),
        '/login': (_) => const Center(child: Text('ログインしてね')),
      },
    );
  }
}
