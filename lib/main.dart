import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_payment_app/constant/colors.dart';
import 'package:internet_payment_app/page/payment/payment_page.dart';
import 'package:internet_payment_app/routes/pages_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: kColorYipyRed),
      //   useMaterial3: true,
      // ),
      getPages: PagesRoute.pages,
      home: PaymentPage(),
    );
  }
}
