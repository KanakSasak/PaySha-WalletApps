import 'dart:convert';

import 'package:Paysha/data/models/user_response_data_model.dart';
import 'package:equatable/equatable.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse extends Equatable {
  UserResponse({
    required this.data,
  });

  final UserResponseData data;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        data: UserResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };

  @override
  List<Object?> get props => [data];
}
