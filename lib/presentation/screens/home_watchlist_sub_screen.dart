import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_state.dart';
import 'package:crypto_bloc/presentation/widgets/home_sub_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is CryptoFetchSuccessState) {
          final cryptoList = state.cryptoList;
          return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, index) {
                final coin = cryptoList[index];
                return SubTile(
                  rank: coin.marketCapRank,
                  imageUrl: coin.image,
                  symbol: coin.symbol,
                  name: coin.name,
                  price: coin.currentPrice,
                  priceChangePercentage: coin.priceChangePercentage24h,
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 4);
        }
        return const SizedBox();
      },
    );
  }
}
