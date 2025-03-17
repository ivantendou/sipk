// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? id;
    dynamic updatedAt;
    String? role;
    String? fullName;
    dynamic avatarUrl;
    String? serviceBranch;
    String? phoneNumber;
    String? email;
    String? password;

    UserModel({
        this.id,
        this.updatedAt,
        this.role,
        this.fullName,
        this.avatarUrl,
        this.serviceBranch,
        this.phoneNumber,
        this.email,
        this.password,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        updatedAt: json["updated_at"],
        role: json["role"],
        fullName: json["full_name"],
        avatarUrl: json["avatar_url"],
        serviceBranch: json["service_branch"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt,
        "role": role,
        "full_name": fullName,
        "avatar_url": avatarUrl,
        "service_branch": serviceBranch,
        "phone_number": phoneNumber,
        "email": email,
        "password": password,
    };
}
