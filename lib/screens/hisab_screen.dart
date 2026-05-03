import 'package:flutter/material.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';

class HisabScreen extends StatelessWidget {
  const HisabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "Hisab"));
  }
}
