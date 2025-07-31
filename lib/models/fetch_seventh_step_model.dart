// To parse this JSON data, do
//
//     final fetchSeventhStepModel = fetchSeventhStepModelFromJson(jsonString);

import 'dart:convert';

FetchSeventhStepModel fetchSeventhStepModelFromJson(String str) => FetchSeventhStepModel.fromJson(json.decode(str));

String fetchSeventhStepModelToJson(FetchSeventhStepModel data) => json.encode(data.toJson());

class FetchSeventhStepModel {
    String? bankingRelationship;
    String? averageMonthlyBalance;
    String? averageTransactionFrequency;
    String? applicantCreditQuality;
    String? applicantCreditRating;
    String? spouseCreditRating;

    FetchSeventhStepModel({
        this.bankingRelationship,
        this.averageMonthlyBalance,
        this.averageTransactionFrequency,
        this.applicantCreditQuality,
        this.applicantCreditRating,
        this.spouseCreditRating,
    });

    factory FetchSeventhStepModel.fromJson(Map<String, dynamic> json) => FetchSeventhStepModel(
        bankingRelationship: json["banking_relationship"],
        averageMonthlyBalance: json["average_monthly_balance"],
        averageTransactionFrequency: json["average_transaction_frequency"],
        applicantCreditQuality: json["applicant_credit_quality"],
        applicantCreditRating: json["applicant_credit_rating"],
        spouseCreditRating: json["spouse_credit_rating"],
    );

    Map<String, dynamic> toJson() => {
        "banking_relationship": bankingRelationship,
        "average_monthly_balance": averageMonthlyBalance,
        "average_transaction_frequency": averageTransactionFrequency,
        "applicant_credit_quality": applicantCreditQuality,
        "applicant_credit_rating": applicantCreditRating,
        "spouse_credit_rating": spouseCreditRating,
    };
}
