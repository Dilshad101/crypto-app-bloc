

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CryptoCurrency extends Equatable{
  String id;
  String symbol;
  String name;
  String image;
  num currentPrice;
  int marketCapRank;
  num high24h;
  num low24h;
  double priceChangePercentage24h;

  

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChangePercentage24h,
  });

  

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCapRank: json['market_cap_rank'],
      high24h: json['high_24h'],
      low24h: json['low_24h'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
    );
  }

  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap_rank': marketCapRank,
      'high_24h': high24h,
      'low_24h': low24h,
      'price_change_percentage_24h': priceChangePercentage24h,
    };
  }
 @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCapRank,
        high24h,
        low24h,
        priceChangePercentage24h,
      ];
}
