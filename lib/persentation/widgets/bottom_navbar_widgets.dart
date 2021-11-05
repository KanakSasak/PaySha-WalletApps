import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/persentation/pages/qr_page.dart';
import 'package:e_wallet_new/persentation/provider/bottom_navbar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidgets extends StatelessWidget {
  final int selectedIndex;
  final Function? onTap;

  BottomNavigationBarWidgets({
    this.onTap,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    var bottomNavbarNotifier = Provider.of<BottomNavbarNotifier>(context);

    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffF2F4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              bottomNavbarNotifier.currentIndex = 0;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/home.svg",
                  height: 25,
                  color: selectedIndex == 0 ? primaryColor : greyColor,
                ),
                Text(
                  "Home",
                  style: primaryFontStyle.copyWith(
                    fontWeight: bold,
                    color: selectedIndex == 0 ? primaryColor : greyColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              bottomNavbarNotifier.currentIndex = 1;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/history.svg",
                  height: 25,
                  color: selectedIndex == 1 ? primaryColor : greyColor,
                ),
                Text(
                  "History",
                  style: primaryFontStyle.copyWith(
                    fontWeight: bold,
                    color: selectedIndex == 1 ? primaryColor : greyColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, QrPage.ROUTE_NAME);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 4.5,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: whiteColor,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bottomNavbarNotifier.currentIndex = 2;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/card.svg",
                  height: 25,
                  color: selectedIndex == 2 ? primaryColor : greyColor,
                ),
                Text(
                  "Card",
                  style: primaryFontStyle.copyWith(
                    fontWeight: bold,
                    color: selectedIndex == 2 ? primaryColor : greyColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              bottomNavbarNotifier.currentIndex = 3;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/user.svg",
                  height: 25,
                  color: selectedIndex == 3 ? primaryColor : greyColor,
                ),
                Text(
                  "Profil",
                  style: primaryFontStyle.copyWith(
                    fontWeight: bold,
                    color: selectedIndex == 3 ? primaryColor : greyColor,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
