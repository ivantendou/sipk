// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> userModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String userModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
    String? id;
    dynamic updatedAt;
    String? role;
    String? fullName;
    dynamic avatarUrl;
    String? serviceBranch;
    String? phoneNumber;

    UsersModel({
        this.id,
        this.updatedAt,
        this.role,
        this.fullName,
        this.avatarUrl,
        this.serviceBranch,
        this.phoneNumber,
    });

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["id"],
        updatedAt: json["updated_at"],
        role: json["role"],
        fullName: json["full_name"],
        avatarUrl: json["avatar_url"],
        serviceBranch: json["service_branch"],
        phoneNumber: json["phone_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt,
        "role": role,
        "full_name": fullName,
        "avatar_url": avatarUrl,
        "service_branch": serviceBranch,
        "phone_number": phoneNumber,
    };
}
