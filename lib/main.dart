import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_bloc.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/home_state.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/screens/home_screen.dart';
import 'package:crypto_price_list_app_with_clean_architecture/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => locator<HomeBloc>(),
        child: HomeScreen(),
      ),
    );
  }
}
