import 'package:Paysha/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    required this.id,
    required this.fireUid,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
    required this.role,
    required this.wallet,
    required this.createDate,
    required this.createTime,
    required this.createdBy,
    required this.lastChangeBy,
    required this.lastUpdateDate,
    required this.lastUpdateTime,
    required this.active,
  });

  final int? id;
  final String? fireUid;
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? address;
  final String? role;
  final String? wallet;
  final DateTime? createDate;
  final String? createTime;
  final String? createdBy;
  final String? lastChangeBy;
  final DateTime? lastUpdateDate;
  final String? lastUpdateTime;
  final bool? active;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fireUid: json["fire_uid"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        role: json["role"],
        wallet: json["wallet"],
        createDate: DateTime.parse(json["create_date"]),
        createTime: json["create_time"],
        createdBy: json["created_by"],
        lastChangeBy: json["last_change_by"],
        lastUpdateDate: DateTime.parse(json["last_update_date"]),
        lastUpdateTime: json["last_update_time"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fire_uid": fireUid,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "address": address,
        "role": role,
        "wallet": wallet,
        "create_date":
            "${createDate!.year.toString().padLeft(4, '0')}-${createDate!.month.toString().padLeft(2, '0')}-${createDate!.day.toString().padLeft(2, '0')}",
        "create_time": createTime,
        "created_by": createdBy,
        "last_change_by": lastChangeBy,
        "last_update_date":
            "${lastUpdateDate!.year.toString().padLeft(4, '0')}-${lastUpdateDate!.month.toString().padLeft(2, '0')}-${lastUpdateDate!.day.toString().padLeft(2, '0')}",
        "last_update_time": lastUpdateTime,
        "active": active,
      };

  User toentity() {
    return User(
      id: id,
      fireUid: fireUid,
      name: name,
      phone: phone,
      email: email,
      password: password,
      address: address,
      role: role,
      wallet: wallet,
      createDate: createDate,
      createTime: createTime,
      createdBy: createdBy,
      lastChangeBy: lastChangeBy,
      lastUpdateDate: lastUpdateDate,
      lastUpdateTime: lastUpdateTime,
      active: active,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fireUid,
        name,
        phone,
        email,
        password,
        address,
        role,
        wallet,
        createDate,
        createTime,
        createdBy,
        lastChangeBy,
        lastUpdateDate,
        lastUpdateTime,
        active,
      ];
}
