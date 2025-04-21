import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/shared/home_page.dart';
import 'pages/client/client_dashboard_page.dart';
import 'pages/contractor/contractor_dashboard_page.dart';

void main() {
  runApp(const HandymanApp());
}

class HandymanApp extends StatelessWidget {
  const HandymanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Handyman App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/client_dashboard', page: () => const ClientDashboard()),
        GetPage(name: '/contractor_dashboard', page: () => const ContractorDashboard()),
      ],
    );
  }
}
