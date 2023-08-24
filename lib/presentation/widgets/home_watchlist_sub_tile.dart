import 'package:crypto_bloc/domain/models/crypto_model.dart';
import 'package:crypto_bloc/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:crypto_bloc/presentation/constents/spaces.dart';
import 'package:crypto_bloc/data/data_sources/home_watchlist_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListSubTile extends StatelessWidget {
  const WatchListSubTile(
      {super.key,
      required this.rank,
      required this.imageUrl,
      required this.symbol,
      required this.name,
      required this.price,
      required this.priceChangePercentage,
      required this.coin});
  final int rank;
  final String imageUrl;
  final String symbol;
  final String name;
  final num price;
  final num priceChangePercentage;
  final CryptoCurrency coin;
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
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              vSpace10,
              Text(
                '₹ $price',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        priceChangePercentage < 0 ? Icons.remove : Icons.add,
                        size: 14,
                        color: priceChangePercentage < 0
                            ? Colors.redAccent
                            : Colors.greenAccent,
                      ),
                      hSpace5,
                      Text(
                        priceChangePercentage.abs().toStringAsFixed(3),
                        style: TextStyle(
                          fontSize: 16,
                          color: priceChangePercentage < 0
                              ? Colors.redAccent
                              : Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                vSpace10,
                TextButton.icon(
                  onPressed: () {
                    // watchList.add(coin);
                    context
                        .read<WatchlistBloc>()
                        .add(WatchListRemoveEvent(watchList: watchList,coin: coin));
                  },
                  label: const Text(
                    'WatchList',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  icon: const Icon(Icons.remove,size: 18,color: Colors.grey,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
