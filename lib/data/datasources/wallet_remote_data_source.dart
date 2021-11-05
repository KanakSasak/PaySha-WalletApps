import 'dart:convert';

import 'package:e_wallet_new/common/exception.dart';
import 'package:e_wallet_new/data/models/balance_model.dart';
import 'package:e_wallet_new/data/models/wallet_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class WalletRemoteDataSource {
  Future<BalanceModel> getBalance(String token);
  Future<WalletModel> transferBalance(
    String walletId,
    String amount,
    String token,
  );
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  static const BASE_URL =
      "https://a8c0-36-90-123-166.ngrok.io/v1/cust/get/wallet";

  final http.Client client;

  WalletRemoteDataSourceImpl({required this.client});

  Logger _logger = Logger();

  @override
  Future<BalanceModel> getBalance(String token) async {
    final response = await client.get(Uri.parse("$BASE_URL/balance"), headers: {
      'Authorization': 'Bearer $token',
    });

    _logger.d(response.statusCode);
    _logger.d(response.body);

    if (response.statusCode == 200) {
      return BalanceModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<WalletModel> transferBalance(
    String walletId,
    String amount,
    String token,
  ) async {
    final response = await client.post(
      Uri.parse(
        "http://a8c0-36-90-123-166.ngrok.io/v1/cust/bayar/$walletId/$amount",
      ),
      headers: {'Authorization': 'Bearer $token'},
    );

    _logger.d(response.statusCode);
    _logger.d(response.body);

    if (response.statusCode == 200) {
      return WalletModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
