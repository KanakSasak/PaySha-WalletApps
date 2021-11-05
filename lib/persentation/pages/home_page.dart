import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/common/state_enum.dart';
import 'package:e_wallet_new/data/models/moock_data.dart';
import 'package:e_wallet_new/domain/entities/user.dart';
import 'package:e_wallet_new/persentation/pages/scanner_page.dart';
import 'package:e_wallet_new/persentation/provider/wallet_notifier.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = "/home-page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? token;

  Widget _buildCustomBottom({
    required String text,
    required Function onTap,
    Color? colorIcon,
    bool? circleIcon,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 10.0,
              spreadRadius: 4.5,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          children: [
            circleIcon != null
                ? CircleAvatar(
                    radius: 8,
                    backgroundColor: colorIcon,
                  )
                : SizedBox(),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: blackFontStyle.copyWith(
                fontWeight: bold,
                color: Colors.grey[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Function onTap,
    required String title,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color.fromRGBO(234, 245, 248, 1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: Colors.blue[900],
                size: 30,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: whiteFontStyle.copyWith(
                color: lightBlue,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() => Provider.of<WalletNotifier>(context, listen: false)
        .getBalanceUser(User.token!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            // Note: Top Data
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Note: AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<WalletNotifier>(
                        builder: (context, wallet, child) {
                          if (wallet.walletRequestState ==
                              RequestState.Loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (wallet.walletRequestState ==
                              RequestState.Loaded) {
                            return Text(
                              "\$${wallet.balance.data}",
                              style: whiteFontStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 30,
                              ),
                            );
                          } else {
                            return Text(wallet.message);
                          }
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: lightBlue,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: whiteColor,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/profile.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Available Balance",
                    style: lightBlueFontStyle.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // Note: Menu AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Note: Menu AppBar Item
                      _buildMenuItem(
                        onTap: () {
                          Navigator.pushNamed(context, ScannerPage.ROUTE_NAME);
                        },
                        title: "Send",
                        icon: MdiIcons.transfer,
                      ),
                      _buildMenuItem(
                        onTap: () {},
                        title: "Request",
                        icon: Icons.public,
                      ),
                      _buildMenuItem(
                        onTap: () {},
                        title: "Loan",
                        icon: Icons.attach_money,
                      ),
                      _buildMenuItem(
                        onTap: () {},
                        title: "Topup",
                        icon: Icons.trending_down,
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Note: Body
            DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        // Note: Title
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recent Transaction",
                                style: blackFontStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "See All",
                                style: blackFontStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // Note: Buttons
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Row(
                            children: [
                              // Note: Buttons 1
                              _buildCustomBottom(
                                text: "All   ",
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Note: Buttons 2
                              _buildCustomBottom(
                                text: "Income",
                                circleIcon: true,
                                colorIcon: Colors.green,
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Note: Buttons 3
                              _buildCustomBottom(
                                text: "Expenses",
                                circleIcon: true,
                                colorIcon: Colors.orange,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        // Note: List View for expenses and income
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Text(
                            "Today",
                            style: greyFontStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: mockLengthData.length,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: defaultMargin,
                              ),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  topRight: index == 0
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  bottomLeft: index == mockLengthData.length - 1
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  bottomRight:
                                      index == mockLengthData.length - 1
                                          ? Radius.circular(20)
                                          : Radius.circular(0),
                                ),
                                color: whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.grey[100],
                                    ),
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Grocery",
                                          style: primaryFontStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Eatly Downtown",
                                          style: primaryFontStyle.copyWith(
                                            fontWeight: medium,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "-\$50.68",
                                        style: primaryFontStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Aug 26",
                                        style: primaryFontStyle.copyWith(
                                          fontWeight: medium,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // Note: Expense
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Text(
                            "YESTERDAY",
                            style: greyFontStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: mockLengthData.length,
                          padding: EdgeInsets.all(0),
                          controller: ScrollController(keepScrollOffset: false),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: defaultMargin,
                              ),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  topRight: index == 0
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  bottomLeft: index == mockLengthData.length - 1
                                      ? Radius.circular(20)
                                      : Radius.circular(0),
                                  bottomRight:
                                      index == mockLengthData.length - 1
                                          ? Radius.circular(20)
                                          : Radius.circular(0),
                                ),
                                color: whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.grey[100],
                                    ),
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Payment",
                                          style: primaryFontStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "Payemnet from Andre",
                                          style: primaryFontStyle.copyWith(
                                            fontWeight: medium,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "-\$50.68",
                                        style: primaryFontStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Text(
                                        "Aug 26",
                                        style: primaryFontStyle.copyWith(
                                          fontWeight: medium,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
