part of 'watchlist_bloc.dart';

abstract class WatchlistState {}

final class WatchlistInitialState extends WatchlistState {}

final class WatchlistSuccessState extends WatchlistState {
  List<CryptoCurrency> watchList;
  WatchlistSuccessState({required this.watchList});
}
