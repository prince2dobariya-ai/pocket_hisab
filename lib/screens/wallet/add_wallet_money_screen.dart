import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_hisab/controllers/wallet_controller.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';
import 'package:pocket_hisab/widgets/custome_textform_filed.dart';

class AddWalletMoneyScreen extends StatefulWidget {
  const AddWalletMoneyScreen({super.key});

  @override
  State<AddWalletMoneyScreen> createState() => _AddWalletMoneyScreenState();
}

class _AddWalletMoneyScreenState extends State<AddWalletMoneyScreen> {
  final _amountController = TextEditingController();
  final _sourceController = TextEditingController(text: "Salary");
  final walletCtrl = Get.find<WalletController>();

  @override
  void dispose() {
    _amountController.dispose();
    _sourceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Add to Wallet"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            const Text(
              "Amount",
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _amountController,
              keyboardType: .number,
              labelText: "Amount",
              hintText: "Enter amount (e.g. 5000)",
            ),
            const SizedBox(height: 24),
            const Text(
              "Source",
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                final sources = ['Salary', 'Saving'];
                return Wrap(
                  spacing: 12,
                  children: sources.map((source) {
                    final isSelected = _sourceController.text == source;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _sourceController.text = source;
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const .symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue.shade400
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue.shade400
                                : Colors.transparent,
                          ),
                        ),
                        child: Text(
                          source,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? .bold : .normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final amountText = _amountController.text.trim();
                  if (amountText.isEmpty) {
                    Get.snackbar('Error', 'Please enter amount');
                    return;
                  }
                  final amount = double.tryParse(amountText);
                  if (amount == null || amount <= 0) {
                    Get.snackbar('Error', 'Invalid amount entered');
                    return;
                  }

                  if (walletCtrl.wallets.isEmpty) {
                    Get.snackbar('Error', 'No wallet found');
                    return;
                  }
                  final targetWalletId = walletCtrl.wallets.first.id!;

                  await walletCtrl.credit(
                    walletId: targetWalletId,
                    amount: amount,
                    source: _sourceController.text,
                    note: "Added from ${_sourceController.text}",
                  );

                  Get.back();
                },
                child: const Text(
                  "Add Money",
                  style: TextStyle(fontSize: 18, fontWeight: .bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
