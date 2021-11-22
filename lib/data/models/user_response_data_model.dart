import 'package:Paysha/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserResponseData extends Equatable {
  UserResponseData({
    required this.expires,
    required this.token,
    required this.data,
  });

  final DateTime expires;
  final String token;
  final UserModel data;

  factory UserResponseData.fromJson(Map<String, dynamic> json) =>
      UserResponseData(
        expires: DateTime.parse(json["expires"]),
        token: json["token"],
        data: UserModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "expires": expires.toIso8601String(),
        "token": token,
        "data": data.toJson(),
      };

  @override
  List<Object?> get props => [expires, token, data];
}
