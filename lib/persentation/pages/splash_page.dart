import 'dart:async';

import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/persentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }

  void onDone() {
    Navigator.pushReplacementNamed(context, SignInPage.ROUTE_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 150,
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/1.png",
                    height: 100,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                "In Collaburations with\nBUMN and Sharia Economy",
                textAlign: TextAlign.center,
                style: greyFontStyle,
              ),
              Image.asset(
                "assets/2.png",
                height: 100,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
