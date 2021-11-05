import 'dart:convert';

import 'package:e_wallet_new/domain/entities/balance.dart';

BalanceModel balanceModelFromJson(String str) =>
    BalanceModel.fromJson(json.decode(str));

String balanceModelToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
  BalanceModel({
    required this.data,
  });

  String data;

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Balance toEntity() {
    return Balance(data: data);
  }
}
