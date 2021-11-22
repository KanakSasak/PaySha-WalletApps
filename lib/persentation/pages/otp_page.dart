import 'package:Paysha/common/constants.dart';
import 'package:Paysha/persentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpPage extends StatefulWidget {
  static const ROUTE_NAME = "/otp-page";

  final String mobilePhone;

  OtpPage({
    required this.mobilePhone,
    Key? key,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  Widget _buildTextFieldOtp({
    bool? isFirst,
    bool? isLast,
    TextEditingController? otpController,
    BuildContext? context,
  }) {
    return Container(
      height: 70,
      child: AspectRatio(
        aspectRatio: 0.9,
        child: TextField(
          controller: otpController,
          autofocus: true,
          onChanged: (val) {
            if (val.length == 1 && isLast == false) {
              FocusScope.of(context!).nextFocus();
            }

            if (val.length == 0 && isFirst == false) {
              FocusScope.of(context!).previousFocus();
            }

            print(val);
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: primaryFontStyle.copyWith(
            fontSize: 24,
            fontWeight: bold,
          ),
          maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: greyColor),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: defaultMargin,
                    ),
                    child: Text(
                      "Verifiy Account",
                      style: greyFontStyle,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: SvgPicture.asset(
                      "assets/ilustrasi3.svg",
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Mobile verification has \nsuccessfully done",
                      textAlign: TextAlign.center,
                      style: blackFontStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "We have send the OTP on ${widget.mobilePhone} \nwill apply auto the fields",
                      textAlign: TextAlign.center,
                      style: greyFontStyle,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTextFieldOtp(
                          isFirst: true,
                          isLast: false,
                          otpController: otpController1,
                          context: context,
                        ),
                        _buildTextFieldOtp(
                          isFirst: false,
                          isLast: false,
                          otpController: otpController2,
                          context: context,
                        ),
                        _buildTextFieldOtp(
                          isFirst: false,
                          isLast: false,
                          otpController: otpController3,
                          context: context,
                        ),
                        _buildTextFieldOtp(
                          isFirst: false,
                          isLast: true,
                          otpController: otpController4,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainPage.ROUTE_NAME,
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Verifiy",
                        style: whiteFontStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
