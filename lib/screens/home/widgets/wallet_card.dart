import 'package:flutter/material.dart';
import 'package:pocket_hisab/screens/wallet_screen.dart';
import 'package:pocket_hisab/screens/add_wallet_money_screen.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WalletScreen()),
        );
      },

      child: Card(
        color: const Color.fromRGBO(227, 242, 253, 1),
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        child: Padding(
          padding: .all(16.0),
          child: Column(
            spacing: 5,
            crossAxisAlignment: .start,
            children: [
              Row(
                spacing: 5,
                children: [Icon(Icons.account_balance_wallet), Text("Wallet")],
              ),
              Text(
                "₹10,000",
                style: TextStyle(fontSize: 24, fontWeight: .bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddWalletMoneyScreen(),
                    ),
                  );
                },
                child: const Text("+ Add Money"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
