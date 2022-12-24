import 'package:crypto_price_list_app_with_clean_architecture/core/utils/constants.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/crypto_status.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_bloc.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_event.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCryptoEvent());
  }

  Future refresh() async {
    BlocProvider.of<HomeBloc>(context).add(LoadCryptoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      body: BlocBuilder<HomeBloc, Homestate>(
        builder: (context, state) {
          if (state.cryptoStatus is CryptoLoading) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Constants.greenColor, size: 100),
            );
          }
          if (state.cryptoStatus is CryptoCompleted) {
            CryptoCompleted completed = state.cryptoStatus as CryptoCompleted;
            return RefreshIndicator(
              onRefresh: refresh,
              backgroundColor: Constants.greenColor,
              color: Constants.blackColor,
              child: ListView.builder(
                itemCount: completed.cryptoList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    completed.cryptoList[index].name!,
                    style: const TextStyle(color: Constants.greenColor),
                  ),
                  subtitle: Text(
                    completed.cryptoList[index].symbol!,
                    style: const TextStyle(color: Constants.greyColor),
                  ),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        completed.cryptoList[index].rank!.toString(),
                        style: const TextStyle(color: Constants.greyColor),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            completed.cryptoList[index].priceUsd!
                                .toStringAsFixed(2),
                            style: const TextStyle(color: Constants.greyColor),
                          ),
                          Text(
                            completed.cryptoList[index].changePercent24Hr!
                                .toStringAsFixed(2),
                            style: TextStyle(
                              color: (completed.cryptoList[index]
                                          .changePercent24Hr! >=
                                      0)
                                  ? Constants.greenColor
                                  : Constants.redColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      (completed.cryptoList[index].changePercent24Hr! >= 0)
                          ? const Icon(
                              Icons.trending_up,
                              color: Constants.greenColor,
                            )
                          : const Icon(
                              Icons.trending_down,
                              color: Constants.redColor,
                            )
                    ],
                  ),
                ),
              ),
            );
          }
          if (state.cryptoStatus is CryptoError) {
            return const Center(
              child: Text('error'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
