import 'package:bloc/bloc.dart';
import 'package:crypto_price_list_app_with_clean_architecture/core/resources/data_state.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/use_cases/get_crypto_use_case.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/crypto_status.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_event.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, Homestate> {
  GetCryptoUseCase getCryptoUseCase;

  HomeBloc(this.getCryptoUseCase)
      : super(Homestate(cryptoStatus: CryptoLoading())) {
    on<LoadCryptoEvent>((event, emit) async {
      emit(state.copyWith(newCryptoStatus: CryptoLoading()));

      DataState dataState = await getCryptoUseCase();

      if (dataState is DataSuccess) {
        emit(state.copyWith(newCryptoStatus: CryptoCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(newCryptoStatus: CryptoError(dataState.error!)));
      }
    });
  }
}
