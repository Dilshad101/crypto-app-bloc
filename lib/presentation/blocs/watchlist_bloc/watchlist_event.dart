part of 'watchlist_bloc.dart';

abstract class WatchlistEvent {}

class WatchListInitialEvent extends WatchlistEvent {}

class WatchListAddEvent extends WatchlistEvent {
  List<CryptoCurrency> watchList;
  WatchListAddEvent({required this.watchList});
}

class WatchListRemoveEvent extends WatchlistEvent {
  List<CryptoCurrency> watchList;
  final CryptoCurrency coin;
  WatchListRemoveEvent({required this.watchList,required this.coin});
}
