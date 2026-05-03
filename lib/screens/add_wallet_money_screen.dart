import 'package:flutter/material.dart';
import 'package:pocket_hisab/widgets/custom_appbar.dart';

class AddWalletMoneyScreen extends StatefulWidget {
  const AddWalletMoneyScreen({super.key});

  @override
  State<AddWalletMoneyScreen> createState() => _AddWalletMoneyScreenState();
}

class _AddWalletMoneyScreenState extends State<AddWalletMoneyScreen> {
  final _amountController = TextEditingController();
  final _sourceController = TextEditingController(text: "Salary");

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amount",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount (e.g. 5000)",
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Source",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: 'Salary',
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: ['Salary', 'Bonus', 'Other']
                  .map(
                    (source) =>
                        DropdownMenuItem(value: source, child: Text(source)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  _sourceController.text = value;
                }
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
                onPressed: () {
                  // Add logic to save wallet money here
                  Navigator.pop(context);
                },
                child: const Text(
                  "Add Money",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
