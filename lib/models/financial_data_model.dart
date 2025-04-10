// To parse this JSON data, do
//
//     final financialDataModel = financialDataModelFromJson(jsonString);

import 'dart:convert';

FinancialDataModel financialDataModelFromJson(String str) => FinancialDataModel.fromJson(json.decode(str));

String financialDataModelToJson(FinancialDataModel data) => json.encode(data.toJson());

class FinancialDataModel {
    FinancialData? financialData;

    FinancialDataModel({
        this.financialData,
    });

    factory FinancialDataModel.fromJson(Map<String, dynamic> json) => FinancialDataModel(
        financialData: json["financial_data"] == null ? null : FinancialData.fromJson(json["financial_data"]),
    );

    Map<String, dynamic> toJson() => {
        "financial_data": financialData?.toJson(),
    };
}

class FinancialData {
    int? id;
    int? applicantId;
    num? netSalaryApplicant;
    num? netSalarySpouse;
    num? netBusinessIncomeApplicant;
    num? netBusinessIncomeSpouse;
    num? householdExpense;
    num? transportationExpense;
    num? communicationExpense;
    num? educationExpense;
    num? utilityBills;
    num? ongoingInstallment;
    num? entertainmentSocialExpense;
    double? ekvRate;
    String? installmentType;

    FinancialData({
        this.id,
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
        id: json["id"],
        applicantId: json["applicant_id"],
        netSalaryApplicant: json["net_salary_applicant"],
        netSalarySpouse: json["net_salary_spouse"],
        netBusinessIncomeApplicant: json["net_business_income_applicant"],
        netBusinessIncomeSpouse: json["net_business_income_spouse"],
        householdExpense: json["household_expense"],
        transportationExpense: json["transportation_expense"],
        communicationExpense: json["communication_expense"],
        educationExpense: json["education_expense"],
        utilityBills: json["utility_bills"],
        ongoingInstallment: json["ongoing_installment"],
        entertainmentSocialExpense: json["entertainment_social_expense"],
        ekvRate: json["ekv_rate"]?.toDouble(),
        installmentType: json["installment_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
