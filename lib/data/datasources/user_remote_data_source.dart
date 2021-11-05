import 'dart:convert';

import 'package:e_wallet_new/common/exception.dart';
import 'package:e_wallet_new/data/models/user_response_model.dart';
import 'package:e_wallet_new/domain/entities/user.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class UserRemoteDataSource {
  Future<UserResponse> getUser(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  );
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  static const BASE_URL = "https://a8c0-36-90-123-166.ngrok.io/v1/cust/auth";

  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  Logger _logger = Logger();
  bool isLoggedIn = false;

  @override
  Future<UserResponse> getUser(
    String authToken,
    String deviceId,
    String deviceType,
    String phone,
    String signInMethod,
    String tokenFcm,
  ) async {
    Map body = {
      "code": authToken,
      "device_id": deviceId,
      "device_type": deviceType,
      "phone": phone,
      "signing_method": signInMethod,
      "token_fcm": tokenFcm,
      "email": "",
      "password": ""
    };
    _logger.d(body);
    final response = await client.post(
      Uri.parse("$BASE_URL/login"),
      body: json.encode(body),
    );

    _logger.d(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var token = UserResponse.fromJson(json.decode(response.body)).data.token;
      User.token = token;
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
