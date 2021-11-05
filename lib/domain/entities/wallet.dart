import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  Wallet({
    required this.data,
  });

  final String data;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  @override
  List<Object?> get props => [data];
}
