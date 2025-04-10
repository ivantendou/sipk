// To parse this JSON data, do
//
//     final financingApplicationModel = financingApplicationModelFromJson(jsonString);

import 'dart:convert';

FinancingApplicationModel financingApplicationModelFromJson(String str) => FinancingApplicationModel.fromJson(json.decode(str));

String financingApplicationModelToJson(FinancingApplicationModel data) => json.encode(data.toJson());

class FinancingApplicationModel {
    FinancingApplication? financingApplication;
    Applicant? applicant;

    FinancingApplicationModel({
        this.financingApplication,
        this.applicant,
    });

    factory FinancingApplicationModel.fromJson(Map<String, dynamic> json) => FinancingApplicationModel(
        financingApplication: json["financing_application"] == null ? null : FinancingApplication.fromJson(json["financing_application"]),
        applicant: json["applicant"] == null ? null : Applicant.fromJson(json["applicant"]),
    );

    Map<String, dynamic> toJson() => {
        "financing_application": financingApplication?.toJson(),
        "applicant": applicant?.toJson(),
    };
}

class Applicant {
    String? name;

    Applicant({
        this.name,
    });

    factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class FinancingApplication {
    int? id;
    DateTime? createdAt;
    String? accountOfficerId;
    int? applicantId;
    String? officeBranch;
    String? memberStatus;
    String? allocation;
    int? applicationAmount;
    String? applicationStatus;
    dynamic updatedAt;

    FinancingApplication({
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
    });

    factory FinancingApplication.fromJson(Map<String, dynamic> json) => FinancingApplication(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        accountOfficerId: json["account_officer_id"],
        applicantId: json["applicant_id"],
        officeBranch: json["office_branch"],
        memberStatus: json["member_status"],
        allocation: json["allocation"],
        applicationAmount: json["application_amount"],
        applicationStatus: json["application_status"],
        updatedAt: json["updated_at"],
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
    };
}
