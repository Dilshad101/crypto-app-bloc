import 'package:crypto_bloc/data/data_sources/crypto_api.dart';
import 'package:http/http.dart'as http;

class CryptoRepo {
  Future<http.Response> getCrypto() async {
    return await CryptoApi().getCryptocurrency();
  }
}
