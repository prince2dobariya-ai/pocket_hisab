import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_hisab/controllers/dashboard_controller.dart';
import 'package:pocket_hisab/controllers/emi_controller.dart';
import 'package:pocket_hisab/controllers/hisab_controller.dart';
import 'package:pocket_hisab/controllers/person_controller.dart';
import 'package:pocket_hisab/controllers/salary_controller.dart';
import 'package:pocket_hisab/controllers/transaction_controller.dart';
import 'package:pocket_hisab/controllers/wallet_controller.dart';
import 'package:pocket_hisab/screens/home/home_main.dart';
import 'package:pocket_hisab/constants/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Controllers
  Get.put(TransactionController());
  Get.put(WalletController());
  Get.put(SalaryController());
  Get.put(EmiController());
  Get.put(HisabController());
  Get.put(PersonController());
  Get.put(DashboardController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khissu - Pocket Hisab',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .light,
      home: const HomeMain(),
    );
  }
}
