import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/presentation/mobile_app/onboarding/splash_screen.dart';
import 'core/provider/cupertino_switch_provider.dart';
import 'core/provider/interest_rate_provider.dart';
import 'core/provider/payment_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CupertinoSwitchProvider()),
          ChangeNotifierProvider(create: (_) => InterestRateProvider()),
          ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}
