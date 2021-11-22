import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:Paysha/common/constants.dart';
import 'package:Paysha/persentation/pages/main_page.dart';
import 'package:Paysha/persentation/provider/user_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class SignInOtpPage extends StatefulWidget {
  static const ROUTE_NAME = "/sign-in-otp-page";
  const SignInOtpPage({Key? key}) : super(key: key);

  @override
  _SignInOtpPageState createState() => _SignInOtpPageState();
}

class _SignInOtpPageState extends State<SignInOtpPage> {
  TextEditingController phone = TextEditingController();
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();
  final TextEditingController otpController6 = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = "+62";

  String verificationId = '';
  int resendToken = 0;

  bool isLoading = false;
  String loadingMessage = '';
  setLoading(bool b, {String msg = ''}) {
    setState(() {
      isLoading = b;
      loadingMessage = msg;
    });
  }

  bool isVerifyToken = false;
  setVerifyToken(bool b) {
    setState(() {
      isVerifyToken = b;
    });
  }

  int verifyTimeout = 120;
  int verifyTicker = 120;

  Logger _logger = Logger();

  _navigateToMainPage() {
    Navigator.pushNamed(
      context,
      MainPage.ROUTE_NAME,
      arguments: phone.text,
    );
  }

  Widget _buildTextFieldOtp({
    bool? isFirst,
    bool? isLast,
    TextEditingController? otpController,
    BuildContext? context,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 65,
      child: AspectRatio(
        aspectRatio: 0.7,
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

  Widget _buildFormPhoneNumber() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          controller: phone,
          style: primaryFontStyle,
          showCursor: false,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: "Enter mobile number",
            hintStyle: primaryFontStyle,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyTokenForm() {
    return Container(
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
            isLast: false,
            otpController: otpController4,
            context: context,
          ),
          _buildTextFieldOtp(
            isFirst: false,
            isLast: false,
            otpController: otpController5,
            context: context,
          ),
          _buildTextFieldOtp(
            isFirst: false,
            isLast: true,
            otpController: otpController6,
            context: context,
          ),
        ],
      ),
    );
  }

  _authorizeApps(String authToken, BuildContext context) async {
    setLoading(true);
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String deviceId = androidInfo.androidId!;
    String deviceType = androidInfo.brand! + ' ' + androidInfo.model!;

    if (phone.text.startsWith('0')) {
      phoneNumber += phone.text.substring(1, phone.text.length);
    } else {
      phoneNumber += phone.text;
    }

    userNotifier.signInUser(
      authToken,
      deviceId,
      deviceType,
      phone.text,
      "PHONE",
      "12345",
    );

    await Future.delayed(Duration(seconds: 5));
    setLoading(false);
    _navigateToMainPage();
  }

  _authorizeFirebase() async {
    setLoading(true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode:
          "${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}${otpController5.text}${otpController6.text}",
    );

    if (phone.text.startsWith('0')) {
      phoneNumber += phone.text.substring(1, phone.text.length);
    } else {
      phoneNumber += phone.text;
    }

    UserCredential userCredential = await auth.signInWithCredential(credential);
    String authToken = await userCredential.user!.getIdToken();
    _logger.d(authToken);

    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String deviceId = androidInfo.androidId!;
    String deviceType = androidInfo.brand! + ' ' + androidInfo.model!;

    userNotifier.signInUser(
      authToken,
      deviceId,
      deviceType,
      "+62${phone.text}",
      "phone",
      "12345",
    );

    await Future.delayed(Duration(seconds: 5));
    setLoading(false);
    _navigateToMainPage();
  }

  _otpLogin(BuildContext context) async {
    _verifyPhone(context);
    setVerifyToken(true);
    for (var i = verifyTimeout; i > 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        verifyTicker = i;
      });
    }
  }

  _verifyPhone(BuildContext context) async {
    String phoneNumber = "+62";

    if (phone.text.startsWith('0')) {
      phoneNumber += phone.text.substring(1, phone.text.length);
    } else {
      phoneNumber += phone.text;
    }
    _logger.d(phoneNumber);

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        _logger.d(credential);
        UserCredential userCredential = await auth.signInWithCredential(
          credential,
        );

        User? firebaseUser = userCredential.user;

        String authToken = await firebaseUser!.getIdToken();
        _logger.d(authToken);

        // CALL AUTH SERVICE
        _authorizeApps(authToken, context);
      },
      verificationFailed: (FirebaseAuthException e) {
        _logger.d(e);
        setLoading(false);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          body: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              e.message!,
              style: blackFontStyle,
              textAlign: TextAlign.center,
            ),
          ),
          btnOkText: 'Close',
          btnOkColor: Colors.grey,
        )..show();
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
        this.resendToken = resendToken!;
        _logger.d(verificationId);
        _logger.d(resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
        setVerifyToken(false);
      },
      timeout: const Duration(seconds: 120),
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
                      isVerifyToken ? "Verifiy Account" : "Create Your Account",
                      style: greyFontStyle,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: SvgPicture.asset(
                      "assets/ilustrasi2.svg",
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      isVerifyToken
                          ? "Mobile verification has \nsuccessfully done"
                          : "Enter your mobile number to \ncreate account",
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
                      isVerifyToken
                          ? "We have send the OTP on ${phone.text} \nwill apply auto the fields \n$verifyTicker"
                          : "We will send you one time \n password (OTP)",
                      textAlign: TextAlign.center,
                      style: greyFontStyle,
                    ),
                  ),
                  isVerifyToken
                      ? _buildVerifyTokenForm()
                      : _buildFormPhoneNumber(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              isVerifyToken
                                  ? _authorizeFirebase()
                                  : _otpLogin(context);
                            },
                            child: Text(
                              isVerifyToken ? "Login" : "Send",
                              style: whiteFontStyle,
                            ),
                          ),
                  ),
                  isVerifyToken
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                            left: defaultMargin,
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
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "email",
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
            ],
          ),
        ),
      ),
    );
  }
}
