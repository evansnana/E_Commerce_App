import 'dart:async';

import 'package:e_commerce_app/View/all_product_views.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AllProductView()),
      ),
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    TextStyle shoptitlestyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 30,
        );
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
              ),
              SizedBox(
              height: 5,
              ),
              RichText(
                  text: TextSpan(text: "E-", style: shoptitlestyle, children: [
                TextSpan(
                    text: "Shop",
                    style: shoptitlestyle.copyWith(color: Colors.green))
              ]))
            ]),
      ),
    );
  }
}
