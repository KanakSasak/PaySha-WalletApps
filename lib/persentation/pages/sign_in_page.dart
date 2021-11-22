import 'package:Paysha/common/constants.dart';
import 'package:Paysha/persentation/pages/sign_in_otp_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const ROUTE_NAME = "/sign-in-page";

  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    handleLogin() async {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Field cannot be empty",
              textAlign: TextAlign.center,
              style: whiteFontStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ),
        );
      } else {
        // var result = await authProvider.signIn(
        //   emailController.text,
        //   passwordController.text,
        //   44,
        // );

        // if (result) {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => WalletApp()),
        //     (route) => false,
        //   );
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       backgroundColor: alertColor,
        //       content: Text(
        //         "Login failed",
        //         textAlign: TextAlign.center,
        //         style: whiteFontStyle.copyWith(
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   );
        // }
      }
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 70,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryFontStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        controller: emailController,
                        style: greyFontStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Email Address",
                          hintStyle: primaryFontStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryFontStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        style: greyFontStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: "Your Password",
                          hintStyle: primaryFontStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  top: defaultMargin,
                ),
                child: Text(
                  "Login",
                  style: primaryFontStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  top: 2,
                ),
                child: Text(
                  "Sign In to countinue",
                  style: greyFontStyle,
                ),
              ),
              emailInput(),
              passwordInput(),
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                width: double.infinity,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style: whiteFontStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  onPressed: handleLogin,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(
                  left: defaultMargin,
                  top: defaultMargin,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in with ",
                      style: greyFontStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignInOtpPage.ROUTE_NAME);
                      },
                      child: Text(
                        "phone number ",
                        style: primaryFontStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
