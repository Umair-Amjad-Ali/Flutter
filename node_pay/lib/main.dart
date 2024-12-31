// main.dart
import 'package:flutter/material.dart';
import 'package:node_pay/Screens/pages/mission_reward.dart';
import 'package:node_pay/Screens/pages/referral_programe.dart';
import 'package:node_pay/Screens/pages/transaction_hoistory.dart';
import 'package:node_pay/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NodePay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Default home page
      routes: {
        '/referral': (context) => const ReferralPrograme(),
        '/mission_reward': (context) => const MissionReward(),
        '/transaction_history': (context) => const TransactionHoistory(),
      },
    );
  }
}
