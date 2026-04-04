import 'package:flutter/material.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/download_page.dart';
import 'pages/home_page.dart';
import 'pages/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScanAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5A3182)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/about': (context) => const AboutPage(),
        '/products': (context) => const ProductPage(),
        '/download': (context) => const DownloadPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
  }
}
