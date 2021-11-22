import 'package:Paysha/persentation/pages/amount_page.dart';
import 'package:Paysha/persentation/pages/history_page.dart';
import 'package:Paysha/persentation/pages/home_page.dart';
import 'package:Paysha/persentation/pages/main_page.dart';
import 'package:Paysha/persentation/pages/otp_page.dart';
import 'package:Paysha/persentation/pages/qr_page.dart';
import 'package:Paysha/persentation/pages/scanner_page.dart';
import 'package:Paysha/persentation/pages/sign_in_otp_page.dart';
import 'package:Paysha/persentation/pages/sign_in_page.dart';
import 'package:Paysha/persentation/pages/splash_page.dart';
import 'package:Paysha/persentation/provider/bottom_navbar_notifier.dart';
import 'package:Paysha/persentation/provider/scanner_notifier.dart';
import 'package:Paysha/persentation/provider/user_notifier.dart';
import 'package:Paysha/persentation/provider/wallet_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as getIt;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavbarNotifier>(
          create: (context) => BottomNavbarNotifier(),
        ),
        ChangeNotifierProvider<UserNotifier>(
          create: (context) => UserNotifier(getUser: getIt.getIt()),
        ),
        ChangeNotifierProvider<UserNotifier>(
          create: (context) => UserNotifier(getUser: getIt.getIt()),
        ),
        ChangeNotifierProvider<ScannerNotifier>(
          create: (context) => ScannerNotifier(),
        ),
        ChangeNotifierProvider<WalletNotifier>(
          create: (context) => WalletNotifier(
            getBalance: getIt.getIt(),
            getTransferBalance: getIt.getIt(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case "/splash-page":
              return MaterialPageRoute(builder: (_) => SplashPage());
            case MainPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => MainPage());
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomePage());
            case SignInPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SignInPage());
            case SignInOtpPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SignInOtpPage());
            case HistoryPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HistoryPage());
            case QrPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => QrPage());
            case ScannerPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => ScannerPage());
            case AmountPage.ROUTE_NAME:
              var walletID = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => AmountPage(walletID: walletID),
              );
            case OtpPage.ROUTE_NAME:
              var mobilePhone = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => OtpPage(
                  mobilePhone: mobilePhone,
                ),
              );

            default:
              return MaterialPageRoute(
                builder: (_) {
                  return Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
