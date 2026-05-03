import 'package:flutter/material.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "Wallet"));
  }
}
