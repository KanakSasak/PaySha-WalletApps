import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  Balance({
    required this.data,
  });

  final String data;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  @override
  List<Object?> get props => [data];
}
