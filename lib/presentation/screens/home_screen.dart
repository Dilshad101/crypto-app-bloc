import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_bloc.dart';
import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_event.dart';
import 'package:crypto_bloc/presentation/screens/home_currency_sub_screen.dart';
import 'package:crypto_bloc/presentation/screens/home_watchlist_sub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    context.read<CryptoBloc>().add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Crypto',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Coin'),
                Tab(text: 'WatchList'),
              ],
              indicatorColor: Colors.yellow,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CurrencyPage(),
                  WatchListPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
