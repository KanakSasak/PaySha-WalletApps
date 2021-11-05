import 'dart:convert';

import 'package:e_wallet_new/domain/entities/wallet.dart';
import 'package:equatable/equatable.dart';

WalletModel walletModelFromJson(String str) =>
    WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel extends Equatable {
  WalletModel({
    required this.data,
  });

  final String data;

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Wallet toEntity() {
    return Wallet(data: data);
  }

  @override
  List<Object?> get props => [data];
}
