import 'package:flutter/material.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Column(
        children: [
          /// saving max limit both rang picker and normal picker
          Card(
            child: ListTile(
              title: Text('Saving Max Limit'),
              subtitle: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Range : '),
                  TextButton(
                    onPressed: () {},
                    child: Text('0'),
                  ), // normal text picker
                  Text('   to   '),
                  TextButton(
                    onPressed: () {},
                    child: Text('10000'),
                  ), // range picker
                ],
              ),
            ),
          ),

          /// wallet min limit
          Card(
            child: ListTile(
              title: Text('Wallet Min Limit'),
              subtitle: Text('Set min limit for wallet'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
