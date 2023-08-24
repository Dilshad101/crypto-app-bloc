
import 'package:http/http.dart' as http;

class CryptoApi {
  final String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=30&page=1&sparkline=false&locale=en';

  Future<http.Response> getCryptocurrency() async {
     final response= await http.get(Uri.parse(url));
    // final http.Response response;
    // response=http.Response(output, 200);
    //  print(response.statusCode);
    // final List json = jsonDecode(output);
    // return json.map((e) => CryptoCurrency.fromJson(e)).toList();
    return response;
  }
}

const String output = '''[
    {
        "id": "bitcoin",
        "symbol": "btc",
        "name": "Bitcoin",
        "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        "current_price": 26027,
        "market_cap": 506647137630,
        "market_cap_rank": 1,
        "fully_diluted_valuation": 546584758515,
        "total_volume": 14931644177,
        "high_24h": 26183,
        "low_24h": 25575,
        "price_change_24h": -21.866527104819397,
        "price_change_percentage_24h": -0.08394,
        "market_cap_change_24h": -301823700.63946533,
        "market_cap_change_percentage_24h": -0.05954,
        "circulating_supply": 19465581.0,
        "total_supply": 21000000.0,
        "max_supply": 21000000.0,
        "ath": 69045,
        "ath_change_percentage": -62.30392,
        "ath_date": "2021-11-10T14:24:11.849Z",
        "atl": 67.81,
        "atl_change_percentage": 38283.05891,
        "atl_date": "2013-07-06T00:00:00.000Z",
        "roi": null,
        "last_updated": "2023-08-23T09:05:30.989Z"
    },
    {
        "id": "ethereum",
        "symbol": "eth",
        "name": "Ethereum",
        "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
        "current_price": 1643.48,
        "market_cap": 197550310070,
        "market_cap_rank": 2,
        "fully_diluted_valuation": 197550310070,
        "total_volume": 11854722802,
        "high_24h": 1666.29,
        "low_24h": 1597.41,
        "price_change_24h": -20.653394304013545,
        "price_change_percentage_24h": -1.24109,
        "market_cap_change_24h": -2453671492.688385,
        "market_cap_change_percentage_24h": -1.22681,
        "circulating_supply": 120214313.222187,
        "total_supply": 120214313.222187,
        "max_supply": null,
        "ath": 4878.26,
        "ath_change_percentage": -66.31964,
        "ath_date": "2021-11-10T14:24:19.604Z",
        "atl": 0.432979,
        "atl_change_percentage": 379367.88289,
        "atl_date": "2015-10-20T00:00:00.000Z",
        "roi": {
            "times": 83.41610501837205,
            "currency": "btc",
            "percentage": 8341.610501837205
        },
        "last_updated": "2023-08-23T09:05:32.207Z"
    }]

''';
