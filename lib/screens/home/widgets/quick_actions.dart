import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: .all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: .circle,
                  ),
                  child: Icon(Icons.add, size: 40, color: Colors.white),
                ),
                Text('Add Expense'),
              ],
            ),

            Column(
              children: [
                Container(
                  padding: .all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: .circle,
                  ),
                  child: Icon(
                    Icons.calendar_month,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                Text('Add EMI'),
              ],
            ),

            Column(
              children: [
                Container(
                  padding: .all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: .circle,
                  ),
                  child: Icon(Icons.wallet, size: 40, color: Colors.white),
                ),
                Text('Add Wallet'),
              ],
            ),

            Column(
              children: [
                Container(
                  padding: .all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: .circle,
                  ),
                  child: Icon(Icons.event, size: 40, color: Colors.white),
                ),
                Text('Add Event'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
