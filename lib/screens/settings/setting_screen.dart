import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_hisab/controllers/settings_controller.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCtrl = Get.find<SettingsController>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
                    Obx(
                      () => TextButton(
                        onPressed: () {
                          _showEditDialog(
                            context,
                            'Edit Max Saving Limit',
                            settingsCtrl.maxSavingLimit.value,
                            (val) => settingsCtrl.setMaxSavingLimit(val),
                          );
                        },
                        child: Text(
                          settingsCtrl.maxSavingLimit.value.toStringAsFixed(0),
                        ),
                      ),
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
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    String title,
    double currentValue,
    Function(double) onSave,
  ) {
    final TextEditingController controller = TextEditingController(
      text: currentValue.toStringAsFixed(0),
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter amount"),
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                final val = double.tryParse(controller.text);
                if (val != null && val > 0) {
                  onSave(val);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Please enter a valid amount');
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
