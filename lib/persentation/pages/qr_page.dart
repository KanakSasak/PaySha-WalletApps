import 'package:clipboard/clipboard.dart';
import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/common/state_enum.dart';
import 'package:e_wallet_new/persentation/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  static const ROUTE_NAME = "/qr-page";
  QrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Consumer<UserNotifier>(
                builder: (context, user, child) {
                  if (user.userRequestState == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (user.userRequestState == RequestState.Loaded) {
                    // return Text("${user.user.wallet!}");
                    // _logger.d(user.user.);
                    return Column(
                      children: [
                        Center(
                          child: QrImage(
                            data: user.user.wallet!,
                            version: QrVersions.auto,
                            size: 200,
                          ),
                        ),
                        Text(
                          "Wallet ID",
                          textAlign: TextAlign.center,
                          style: blackFontStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          "${user.user.wallet!}",
                          textAlign: TextAlign.center,
                          style: greyFontStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Copy",
                            style: whiteFontStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          onPressed: () {
                            FlutterClipboard.copy(user.user.wallet!).then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: alertColor,
                                  content: Text(
                                    "Copied",
                                    textAlign: TextAlign.center,
                                    style: whiteFontStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Text(user.message);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
