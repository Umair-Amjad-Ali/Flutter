import 'package:flutter/material.dart';

class EarnigStatistics extends StatelessWidget {
  const EarnigStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earning Statistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Referrals '),
              Text('Referrals '),
              Text('Referrals '),
              Text('Referrals '),
            ],
          )
        ],
      ),
    );
  }
}
