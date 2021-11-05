import 'dart:io';

import 'package:e_wallet_new/common/constants.dart';
import 'package:e_wallet_new/persentation/pages/amount_page.dart';
import 'package:e_wallet_new/persentation/provider/scanner_notifier.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/scanner-page";

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  GlobalKey _qrkey = GlobalKey();
  late QRViewController _controller;

  var isScan;

  String? walletID;

  Logger _logger = Logger();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    }
    _controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    ScannerNotifier scannerNotifier = Provider.of<ScannerNotifier>(context);

    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: _qrkey,
            overlay: QrScannerOverlayShape(borderColor: alertColor),
            onQRViewCreated: (controller) {
              this._controller = controller;

              controller.scannedDataStream.listen((val) async {
                if (mounted) {
                  _controller.dispose();
                  walletID = val.code;
                  if (walletID != null) {
                    Navigator.pushNamed(
                      context,
                      AmountPage.ROUTE_NAME,
                      arguments: walletID,
                    );
                  }
                }
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                "Scanner",
                style: whiteFontStyle.copyWith(
                  fontSize: 26,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 124,
              width: double.infinity,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      scannerNotifier.flashOn = !scannerNotifier.flashOn;
                      _controller.toggleFlash();
                    },
                    icon: Icon(
                      scannerNotifier.flashOn
                          ? Icons.flash_on
                          : Icons.flash_off,
                      size: 30,
                      color: whiteColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      scannerNotifier.frontCam = !scannerNotifier.frontCam;
                      _controller.flipCamera();
                    },
                    icon: Icon(
                      Icons.flip_camera_android,
                      size: 30,
                      color: whiteColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
