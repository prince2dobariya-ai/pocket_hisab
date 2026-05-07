import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pocket_hisab/controllers/wallet_controller.dart';
import 'package:pocket_hisab/helpers/currency_helper.dart';
import 'package:pocket_hisab/screens/expense/add_expense_screen.dart';
import 'package:pocket_hisab/screens/wallet/wallet_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletCtrl = Get.find<WalletController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WalletCard(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton.icon(
                    onPressed: () => Get.to(() => const AddExpenseScreen()),
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text("Add Expense"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red.shade400,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Obx(() {
                if (walletCtrl.transactions.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 64,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No transactions yet",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: walletCtrl.transactions.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final tx = walletCtrl.transactions[index];
                    final isCredit = tx.type == 'credit';
                    final date = DateTime.parse(tx.createdAt);
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isCredit
                              ? Colors.green.withValues(alpha: 0.1)
                              : Colors.red.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isCredit ? Icons.add : Icons.remove,
                          color: isCredit ? Colors.green : Colors.red,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        tx.source,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat('MMM dd, yyyy • hh:mm a').format(date),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Text(
                        "${isCredit ? '+' : '-'}${CurrencyHelper.format(tx.amount)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isCredit ? Colors.green : Colors.red,
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
