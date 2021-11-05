import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/domain/entities/user.dart';
import 'package:e_wallet_new/persentation/pages/main_page.dart';
import 'package:e_wallet_new/persentation/provider/wallet_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmountPage extends StatefulWidget {
  static const ROUTE_NAME = "/amount-page";

  final String? walletID;

  AmountPage({
    required this.walletID,
    Key? key,
  }) : super(key: key);

  @override
  _AmountPageState createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  final TextEditingController amountController = TextEditingController();

  bool isLoading = false;
  setLoading(bool b, {String msg = ''}) {
    setState(() {
      isLoading = b;
    });
  }

  Widget _amountInput() {
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
            "Amount",
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
                  Text(
                    "Rp. ",
                    style: primaryFontStyle,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      controller: amountController,
                      style: greyFontStyle,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration.collapsed(
                        hintText: "Nominal",
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

  @override
  Widget build(BuildContext context) {
    WalletNotifier walletNotifier = Provider.of<WalletNotifier>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            _amountInput(),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              width: double.infinity,
              height: 50,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Pay",
                        style: whiteFontStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      onPressed: () async {
                        setLoading(true);
                        if (amountController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: alertColor,
                              content: Text(
                                "Please enter your nominal",
                                textAlign: TextAlign.center,
                                style: whiteFontStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        }

                        await walletNotifier.getTransferBalanceUser(
                          widget.walletID!,
                          amountController.text,
                          User.token!,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: greenColor,
                            content: Text(
                              walletNotifier.message,
                              textAlign: TextAlign.center,
                              style: whiteFontStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainPage.ROUTE_NAME,
                          (route) => false,
                        );

                        setLoading(false);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
