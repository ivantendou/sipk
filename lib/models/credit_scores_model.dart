// To parse this JSON data, do
//
//     final creditScoresModel = creditScoresModelFromJson(jsonString);

import 'dart:convert';

List<CreditScoresModel> creditScoresModelFromJson(String str) => List<CreditScoresModel>.from(json.decode(str).map((x) => CreditScoresModel.fromJson(x)));

String creditScoresModelToJson(List<CreditScoresModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreditScoresModel {
    String? id;
    String? name;
    String? ktpNumber;
    List<CreditEvaluation>? creditEvaluations;

    CreditScoresModel({
        this.id,
        this.name,
        this.ktpNumber,
        this.creditEvaluations,
    });

    factory CreditScoresModel.fromJson(Map<String, dynamic> json) => CreditScoresModel(
        id: json["id"]?.toString(),
        name: json["name"],
        ktpNumber: json["ktp_number"],
        creditEvaluations: json["credit_evaluations"] == null ? [] : List<CreditEvaluation>.from(json["credit_evaluations"]!.map((x) => CreditEvaluation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ktp_number": ktpNumber,
        "credit_evaluations": creditEvaluations == null ? [] : List<dynamic>.from(creditEvaluations!.map((x) => x.toJson())),
    };
}

class CreditEvaluation {
    CreditScores? creditScores;

    CreditEvaluation({
        this.creditScores,
    });

    factory CreditEvaluation.fromJson(Map<String, dynamic> json) => CreditEvaluation(
        creditScores: json["credit_scores"] == null ? null : CreditScores.fromJson(json["credit_scores"]),
    );

    Map<String, dynamic> toJson() => {
        "credit_scores": creditScores?.toJson(),
    };
}

class CreditScores {
    bool? isDraft;
    DateTime? updatedAt;
    double? totalScore;

    CreditScores({
        this.isDraft,
        this.updatedAt,
        this.totalScore,
    });

    factory CreditScores.fromJson(Map<String, dynamic> json) => CreditScores(
        isDraft: json["is_draft"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        totalScore: json["total_score"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "is_draft": isDraft,
        "updated_at": updatedAt?.toIso8601String(),
        "total_score": totalScore,
    };
}
