import 'dart:convert';

import 'package:crypto_bloc/data/repositories/crypto_repo.dart';
import 'package:crypto_bloc/domain/models/crypto_model.dart';
import 'package:crypto_bloc/presentation/blocs/home_bloc/crypto_state.dart';
import 'package:http/http.dart' as http;

class GetCryptoUseCase {
  Future<CryptoState> getCryptoList() async {
    List<CryptoCurrency> cryptoList = [];
    CryptoState state;
    final http.Response response;
    try {
      response = await CryptoRepo().getCrypto();
      final list = jsonDecode(response.body) as List;
      cryptoList = list.map((e) => CryptoCurrency.fromJson(e)).toList();
      response.statusCode == 200
          ? state = CryptoFetchSuccessState(cryptoList: cryptoList)
          : state = CryptoErrorState();
    } catch (e) {
      state = CryptoErrorState();
    }
    return state;
  }
}
