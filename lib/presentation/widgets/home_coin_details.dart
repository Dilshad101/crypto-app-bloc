import 'package:flutter/material.dart';

import '../constents/spaces.dart';

class CoinDetails extends StatelessWidget {
  const CoinDetails({
    super.key,
    required this.title,
    required this.subtitle,
    this.isPriceTag = false,
    required this.color,
    required this.titleSize,
    required this.subtitleSize,
  });
  final String title;
  final String subtitle;
  final bool isPriceTag;
  final Color color;
  final double titleSize;
  final double subtitleSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: titleSize,

                // isPriceTag ? 13 : 16,
                color: isPriceTag ? Colors.white70 : Colors.white,
              ),
            ),
            vSpace5,
            Text(
              ' $subtitle',
              style: TextStyle(
                  fontSize: subtitleSize,
                  // fontSize: isPriceTag ? 16 : 20,
                  color: color,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
