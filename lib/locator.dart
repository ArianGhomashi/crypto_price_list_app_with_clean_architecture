import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/data/data_source/remote/api_provider.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/data/repository/crypto_repository_impl.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/repository/crypto_repository.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/use_cases/get_crypto_use_case.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  locator.registerSingleton<CryptoRepository>(CryptoRepositoryImpl(locator()));

  locator.registerSingleton<GetCryptoUseCase>(GetCryptoUseCase(locator()));

  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}
