// To parse this JSON data, do
//
//     final financingApplicationsModel = financingApplicationsModelFromJson(jsonString);

import 'dart:convert';

List<FinancingApplicationsModel> financingApplicationsModelFromJson(String str) => List<FinancingApplicationsModel>.from(json.decode(str).map((x) => FinancingApplicationsModel.fromJson(x)));

String financingApplicationsModelToJson(List<FinancingApplicationsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinancingApplicationsModel {
    String? id;
    DateTime? createdAt;
    String? accountOfficerId;
    int? applicantId;
    String? officeBranch;
    String? memberStatus;
    String? allocation;
    int? applicationAmount;
    String? applicationStatus;
    dynamic updatedAt;
    String? name;
    String? ktpNumber;

    FinancingApplicationsModel({
        this.id,
        this.createdAt,
        this.accountOfficerId,
        this.applicantId,
        this.officeBranch,
        this.memberStatus,
        this.allocation,
        this.applicationAmount,
        this.applicationStatus,
        this.updatedAt,
        this.name,
        this.ktpNumber,
    });

    factory FinancingApplicationsModel.fromJson(Map<String, dynamic> json) => FinancingApplicationsModel(
        id: json["id"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        accountOfficerId: json["account_officer_id"],
        applicantId: json["applicant_id"],
        officeBranch: json["office_branch"],
        memberStatus: json["member_status"],
        allocation: json["allocation"],
        applicationAmount: json["application_amount"],
        applicationStatus: json["application_status"],
        updatedAt: json["updated_at"],
        name: json["name"],
        ktpNumber: json["ktp_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "account_officer_id": accountOfficerId,
        "applicant_id": applicantId,
        "office_branch": officeBranch,
        "member_status": memberStatus,
        "allocation": allocation,
        "application_amount": applicationAmount,
        "application_status": applicationStatus,
        "updated_at": updatedAt,
        "name": name,
        "ktp_number": ktpNumber,
    };
}
