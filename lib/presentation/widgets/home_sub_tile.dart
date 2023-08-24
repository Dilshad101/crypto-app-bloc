import 'package:crypto_bloc/presentation/constents/spaces.dart';
import 'package:flutter/material.dart';

class SubTile extends StatelessWidget {
  const SubTile({
    super.key,
    required this.rank,
    required this.imageUrl,
    required this.symbol,
    required this.name,
    required this.price,
    required this.priceChangePercentage,
  });
  final int rank;
  final String imageUrl;
  final String symbol;
  final String name;
  final num price;
  final num priceChangePercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xff25252F),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '# $rank',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          hSpace10,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              vSpace5,
              Text(
                symbol.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          hSpace20,
          // vSpace10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              vSpace10,
              Text(
                '₹ $price',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_border,
                    size: 26,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  priceChangePercentage.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: priceChangePercentage < 0
                        ? Colors.redAccent
                        : Colors.greenAccent,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
