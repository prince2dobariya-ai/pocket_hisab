import 'package:flutter/material.dart';

class SavingCard extends StatelessWidget {
  const SavingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        // context,
        // MaterialPageRoute(builder: (context) => WalletScreen()),
        // );
      },

      child: Card(
        color: Colors.green.shade50,
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        child: Padding(
          padding: .all(16.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              Row(spacing: 5, children: [Icon(Icons.savings), Text("Savings")]),
              Text(
                "₹18,400",
                style: TextStyle(fontSize: 24, fontWeight: .bold),
              ),
              LinearProgressIndicator(
                value: 0.62,
                color: Colors.green,
                minHeight: 12,
                borderRadius: .circular(12),
              ),
              Text('62% Saved', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
