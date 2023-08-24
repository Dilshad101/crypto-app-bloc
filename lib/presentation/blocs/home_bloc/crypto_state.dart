import 'package:crypto_bloc/domain/models/crypto_model.dart';

abstract class CryptoState {}

class CryptoInitialState extends CryptoState {}

class LoadingState extends CryptoState{}

class CryptoFetchSuccessState extends CryptoState{
  final List<CryptoCurrency> cryptoList;
  CryptoFetchSuccessState({required this.cryptoList});
}
class CryptoErrorState extends CryptoState{}