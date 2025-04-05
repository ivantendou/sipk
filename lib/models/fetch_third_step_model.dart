// To parse this JSON data, do
//
//     final fetchThirdStepModel = fetchThirdStepModelFromJson(jsonString);

import 'dart:convert';

FetchThirdStepModel fetchThirdStepModelFromJson(String str) =>
    FetchThirdStepModel.fromJson(json.decode(str));

String fetchThirdStepModelToJson(FetchThirdStepModel data) =>
    json.encode(data.toJson());

class FetchThirdStepModel {
  FinancialData? financialData;
  CreditEvaluation? creditEvaluation;

  FetchThirdStepModel({
    this.financialData,
    this.creditEvaluation,
  });

  factory FetchThirdStepModel.fromJson(Map<String, dynamic> json) =>
      FetchThirdStepModel(
        financialData: json["financial_data"] == null
            ? null
            : FinancialData.fromJson(json["financial_data"]),
        creditEvaluation: json["credit_evaluation"] == null
            ? null
            : CreditEvaluation.fromJson(json["credit_evaluation"]),
      );

  Map<String, dynamic> toJson() => {
        "financial_data": financialData?.toJson(),
        "credit_evaluation": creditEvaluation?.toJson(),
      };
}

class CreditEvaluation {
  int? financingTerm;

  CreditEvaluation({
    this.financingTerm,
  });

  factory CreditEvaluation.fromJson(Map<String, dynamic> json) =>
      CreditEvaluation(
        financingTerm: json["financing_term"],
      );

  Map<String, dynamic> toJson() => {
        "financing_term": financingTerm,
      };
}

class FinancialData {
  int? applicantId;
  int? netSalaryApplicant;
  int? netSalarySpouse;
  int? netBusinessIncomeApplicant;
  int? netBusinessIncomeSpouse;
  int? householdExpense;
  int? transportationExpense;
  int? communicationExpense;
  int? educationExpense;
  int? utilityBills;
  int? ongoingInstallment;
  int? entertainmentSocialExpense;
  double? ekvRate;
  String? installmentType;

  FinancialData({
    this.applicantId,
    this.netSalaryApplicant,
    this.netSalarySpouse,
    this.netBusinessIncomeApplicant,
    this.netBusinessIncomeSpouse,
    this.householdExpense,
    this.transportationExpense,
    this.communicationExpense,
    this.educationExpense,
    this.utilityBills,
    this.ongoingInstallment,
    this.entertainmentSocialExpense,
    this.ekvRate,
    this.installmentType,
  });

  factory FinancialData.fromJson(Map<String, dynamic> json) => FinancialData(
        applicantId: json["applicant_id"],
        netSalaryApplicant: (json["net_salary_applicant"] as num?)?.toInt(),
        netSalarySpouse: (json["net_salary_spouse"] as num?)?.toInt(),
        netBusinessIncomeApplicant:
            (json["net_business_income_applicant"] as num?)?.toInt(),
        netBusinessIncomeSpouse:
            (json["net_business_income_spouse"] as num?)?.toInt(),
        householdExpense: (json["household_expense"] as num?)?.toInt(),
        transportationExpense:
            (json["transportation_expense"] as num?)?.toInt(),
        communicationExpense:
            (json["communication_expense"] as num?)?.toInt(),
        educationExpense: (json["education_expense"] as num?)?.toInt(),
        utilityBills: (json["utility_bills"] as num?)?.toInt(),
        ongoingInstallment: (json["ongoing_installment"] as num?)?.toInt(),
        entertainmentSocialExpense:
            (json["entertainment_social_expense"] as num?)?.toInt(),
        ekvRate: (json["ekv_rate"] as num?)?.toDouble(),
        installmentType: json["installment_type"],
      );

  Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "net_salary_applicant": netSalaryApplicant,
        "net_salary_spouse": netSalarySpouse,
        "net_business_income_applicant": netBusinessIncomeApplicant,
        "net_business_income_spouse": netBusinessIncomeSpouse,
        "household_expense": householdExpense,
        "transportation_expense": transportationExpense,
        "communication_expense": communicationExpense,
        "education_expense": educationExpense,
        "utility_bills": utilityBills,
        "ongoing_installment": ongoingInstallment,
        "entertainment_social_expense": entertainmentSocialExpense,
        "ekv_rate": ekvRate,
        "installment_type": installmentType,
      };
}
