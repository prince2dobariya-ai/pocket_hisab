import 'package:flutter/material.dart';
import 'package:pocket_hisab/constants/app_theme.dart';
import 'package:pocket_hisab/screens/expense/add_expense_screen.dart';
import 'package:pocket_hisab/screens/hisab/person_screen.dart';
import 'package:pocket_hisab/screens/home/home_screen.dart';
import 'package:pocket_hisab/screens/settings/setting_screen.dart';
import 'package:pocket_hisab/screens/wallet/wallet_screen.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Khissu",
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SettingScreen());
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [HomeScreen(), WalletScreen(), PersonScreen()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddExpenseScreen());
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: .endContained,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _tabController.animateTo(0);
                });
              },
              icon: Icon(
                Icons.home,
                size: 28,
                color: _tabController.index == 0
                    ? AppColors.primary
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _tabController.animateTo(1);
                });
              },
              icon: Icon(
                Icons.wallet,
                size: 28,
                color: _tabController.index == 1
                    ? AppColors.primary
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _tabController.animateTo(2);
                });
              },
              icon: Icon(
                Icons.person,
                size: 28,
                color: _tabController.index == 2
                    ? AppColors.primary
                    : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
