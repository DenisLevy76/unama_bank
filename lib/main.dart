import 'package:flutter/material.dart';
import 'package:unama_bank/screens/deposit.dart';
import 'package:unama_bank/screens/home.dart';
import 'package:unama_bank/screens/login.dart';
import 'package:unama_bank/screens/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        '/transaction': (context) => const TransactionPage(),
        '/deposit': (context) => const Deposit(),
      },
    );
  }
}
