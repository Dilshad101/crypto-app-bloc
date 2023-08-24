import 'package:crypto_bloc/presentation/constents/spaces.dart';
import 'package:crypto_bloc/presentation/widgets/home_coin_details.dart';
import 'package:flutter/material.dart';

class LargeTile extends StatelessWidget {
  const LargeTile({
    super.key,
    required this.rank,
    required this.imageUrl,
    required this.symbol,
    required this.name,
    required this.price,
    required this.priceChangePercentage,
    required this.heighestPrice,
    required this.lowestPrice,
  });
  final int rank;
  final String imageUrl;
  final String symbol;
  final String name;
  final num price;
  final num priceChangePercentage;
  final num heighestPrice;
  final num lowestPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.yellow.withOpacity(.2), Colors.white.withOpacity(.1)],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# $rank',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              hSpace10,
              Column(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imageUrl))),
                  ),
                  vSpace5,
                  Text(
                    symbol.toUpperCase(),
                    style: const TextStyle(fontSize: 14, color: Colors.amber),
                  ),
                ],
              ),
              hSpace10,
              Text(
                name,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border,
                  size: 30,
                  color: Colors.amber,
                ),
              )
            ],
          ),
          Row(
            children: [
              CoinDetails(
                title: 'price',
                subtitle: '₹ $price',
                color: Colors.green,
                titleSize: 16,
                subtitleSize: 20,
              ),
              CoinDetails(
                  title: '24h',
                  icon: priceChangePercentage < 0 ? Icons.remove : Icons.add,
                  subtitle: '${priceChangePercentage.abs()}%',
                  color: priceChangePercentage < 0
                      ? Colors.redAccent
                      : Colors.green,
                  titleSize: 16,
                  subtitleSize: 18),
            ],
          ),
          Row(
            children: [
              CoinDetails(
                  title: 'Heighest price in 24h',
                  subtitle: '₹ $heighestPrice',
                  color: const Color(0xff90A571),
                  isPriceTag: true,
                  titleSize: 13,
                  subtitleSize: 16),
              CoinDetails(
                  title: 'Lowest price in 24h',
                  subtitle: '₹ $lowestPrice',
                  color: const Color(0xff925C6E),
                  isPriceTag: true,
                  titleSize: 13,
                  subtitleSize: 16),
            ],
          ),
        ],
      ),
    );
  }
}
