// To parse this JSON data, do
//
//     final fetchSecondStepModel = fetchSecondStepModelFromJson(jsonString);

import 'dart:convert';

FetchSecondStepModel fetchSecondStepModelFromJson(String str) => FetchSecondStepModel.fromJson(json.decode(str));

String fetchSecondStepModelToJson(FetchSecondStepModel data) => json.encode(data.toJson());

class FetchSecondStepModel {
    FinancingApplication? financingApplication;
    CreditEvaluation? creditEvaluation;

    FetchSecondStepModel({
        this.financingApplication,
        this.creditEvaluation,
    });

    factory FetchSecondStepModel.fromJson(Map<String, dynamic> json) => FetchSecondStepModel(
        financingApplication: json["financingApplication"] == null ? null : FinancingApplication.fromJson(json["financingApplication"]),
        creditEvaluation: json["creditEvaluation"] == null ? null : CreditEvaluation.fromJson(json["creditEvaluation"]),
    );

    Map<String, dynamic> toJson() => {
        "financingApplication": financingApplication?.toJson(),
        "creditEvaluation": creditEvaluation?.toJson(),
    };
}

class CreditEvaluation {
    int? financingIteration;

    CreditEvaluation({
        this.financingIteration,
    });

    factory CreditEvaluation.fromJson(Map<String, dynamic> json) => CreditEvaluation(
        financingIteration: json["financing_iteration"],
    );

    Map<String, dynamic> toJson() => {
        "financing_iteration": financingIteration,
    };
}

class FinancingApplication {
    String? financingType;
    int? applicationAmount;
    int? downPaymentPct;
    int? downPaymentAmt;
    String? allocation;

    FinancingApplication({
        this.financingType,
        this.applicationAmount,
        this.downPaymentPct,
        this.downPaymentAmt,
        this.allocation,
    });

    factory FinancingApplication.fromJson(Map<String, dynamic> json) => FinancingApplication(
        financingType: json["financing_type"],
        applicationAmount: json["application_amount"],
        downPaymentPct: json["down_payment_pct"],
        downPaymentAmt: json["down_payment_amt"],
        allocation: json["allocation"],
    );

    Map<String, dynamic> toJson() => {
        "financing_type": financingType,
        "application_amount": applicationAmount,
        "down_payment_pct": downPaymentPct,
        "down_payment_amt": downPaymentAmt,
        "allocation": allocation,
    };
}
