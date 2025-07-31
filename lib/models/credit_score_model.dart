// To parse this JSON data, do
//
//     final creditScoreModel = creditScoreModelFromJson(jsonString);

import 'dart:convert';

CreditScoreModel creditScoreModelFromJson(String str) => CreditScoreModel.fromJson(json.decode(str));

String creditScoreModelToJson(CreditScoreModel data) => json.encode(data.toJson());

class CreditScoreModel {
    Applicant? applicant;
    List<CreditEvaluation>? creditEvaluations;
    List<FinancingApplication>? financingApplications;
    String? accountOfficer;

    CreditScoreModel({
        this.applicant,
        this.creditEvaluations,
        this.financingApplications,
        this.accountOfficer,
    });

    factory CreditScoreModel.fromJson(Map<String, dynamic> json) => CreditScoreModel(
        applicant: json["applicant"] == null ? null : Applicant.fromJson(json["applicant"]),
        creditEvaluations: json["creditEvaluations"] == null ? [] : List<CreditEvaluation>.from(json["creditEvaluations"]!.map((x) => CreditEvaluation.fromJson(x))),
        financingApplications: json["financingApplications"] == null ? [] : List<FinancingApplication>.from(json["financingApplications"]!.map((x) => FinancingApplication.fromJson(x))),
        accountOfficer: json["accountOfficer"],
    );

    Map<String, dynamic> toJson() => {
        "applicant": applicant?.toJson(),
        "creditEvaluations": creditEvaluations == null ? [] : List<dynamic>.from(creditEvaluations!.map((x) => x.toJson())),
        "financingApplications": financingApplications == null ? [] : List<dynamic>.from(financingApplications!.map((x) => x.toJson())),
        "accountOfficer": accountOfficer,
    };
}

class Applicant {
    int? id;
    String? accountOfficerId;
    String? name;
    String? mobilePhone;
    String? residentialAddress;
    String? ktpNumber;
    String? gender;

    Applicant({
        this.id,
        this.accountOfficerId,
        this.name,
        this.mobilePhone,
        this.residentialAddress,
        this.ktpNumber,
        this.gender,
    });

    factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        id: json["id"],
        accountOfficerId: json["account_officer_id"],
        name: json["name"],
        mobilePhone: json["mobile_phone"],
        residentialAddress: json["residential_address"],
        ktpNumber: json["ktp_number"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "account_officer_id": accountOfficerId,
        "name": name,
        "mobile_phone": mobilePhone,
        "residential_address": residentialAddress,
        "ktp_number": ktpNumber,
        "gender": gender,
    };
}

class CreditEvaluation {
    String? applicantCategory;
    CreditScores? creditScores;

    CreditEvaluation({
        this.applicantCategory,
        this.creditScores,
    });

    factory CreditEvaluation.fromJson(Map<String, dynamic> json) => CreditEvaluation(
        applicantCategory: json["applicant_category"],
        creditScores: json["credit_scores"] == null ? null : CreditScores.fromJson(json["credit_scores"]),
    );

    Map<String, dynamic> toJson() => {
        "applicant_category": applicantCategory,
        "credit_scores": creditScores?.toJson(),
    };
}

class CreditScores {
    DateTime? updatedAt;
    double? totalScore;

    CreditScores({
        this.updatedAt,
        this.totalScore,
    });

    factory CreditScores.fromJson(Map<String, dynamic> json) => CreditScores(
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        totalScore: json["total_score"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "updated_at": updatedAt?.toIso8601String(),
        "total_score": totalScore,
    };
}

class FinancingApplication {
    int? applicationAmount;

    FinancingApplication({
        this.applicationAmount,
    });

    factory FinancingApplication.fromJson(Map<String, dynamic> json) => FinancingApplication(
        applicationAmount: json["application_amount"],
    );

    Map<String, dynamic> toJson() => {
        "application_amount": applicationAmount,
    };
}
