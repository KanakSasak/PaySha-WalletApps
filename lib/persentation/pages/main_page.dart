import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/persentation/pages/card_page.dart';
import 'package:e_wallet_new/persentation/pages/history_page.dart';
import 'package:e_wallet_new/persentation/pages/home_page.dart';
import 'package:e_wallet_new/persentation/pages/profile_page.dart';
import 'package:e_wallet_new/persentation/provider/bottom_navbar_notifier.dart';
import 'package:e_wallet_new/persentation/widgets/bottom_navbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  static const ROUTE_NAME = "/main-page";

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedTab = Provider.of<BottomNavbarNotifier>(context);

    var screens = [
      HomePage(),
      HistoryPage(),
      CardPage(),
      ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      body: screens[selectedTab.currentIndex],
      bottomNavigationBar: BottomNavigationBarWidgets(
        selectedIndex: selectedTab.currentIndex,
        onTap: (index) {
          selectedTab = index;
        },
      ),
    );
  }
}
