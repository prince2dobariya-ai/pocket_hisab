import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pocket_hisab/screens/settings/setting_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "Khissu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            leading: Icon(Icons.settings, color: Colors.white),
            onTap: () {
              Get.back();
              Get.to(() => SettingScreen());
            },
          ),
        ],
      ),
    );
  }
}
