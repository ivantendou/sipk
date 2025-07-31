// To parse this JSON data, do
//
//     final fetchFourthStepModel = fetchFourthStepModelFromJson(jsonString);

import 'dart:convert';

FetchFourthStepModel fetchFourthStepModelFromJson(String str) => FetchFourthStepModel.fromJson(json.decode(str));

String fetchFourthStepModelToJson(FetchFourthStepModel data) => json.encode(data.toJson());

class FetchFourthStepModel {
    String? businessReport;
    int? employmentBusinessDuration;
    String? paymentReceiptMethod;
    String? businessPremisesStatus;
    String? salesMethod;
    int? employeeCount;
    String? businessAdministration;
    String? businessLiabilities;
    String? employmentStatus;
    String? employerCredibility;
    String? salarySlip;
    String? accountStatement;
    String? workplaceReputation;

    FetchFourthStepModel({
        this.businessReport,
        this.employmentBusinessDuration,
        this.paymentReceiptMethod,
        this.businessPremisesStatus,
        this.salesMethod,
        this.employeeCount,
        this.businessAdministration,
        this.businessLiabilities,
        this.employmentStatus,
        this.employerCredibility,
        this.salarySlip,
        this.accountStatement,
        this.workplaceReputation,
    });

    factory FetchFourthStepModel.fromJson(Map<String, dynamic> json) => FetchFourthStepModel(
        businessReport: json["business_report"],
        employmentBusinessDuration: json["employment_business_duration"],
        paymentReceiptMethod: json["payment_receipt_method"],
        businessPremisesStatus: json["business_premises_status"],
        salesMethod: json["sales_method"],
        employeeCount: json["employee_count"],
        businessAdministration: json["business_administration"],
        businessLiabilities: json["business_liabilities"],
        employmentStatus: json["employment_status"],
        employerCredibility: json["employer_credibility"],
        salarySlip: json["salary_slip"],
        accountStatement: json["account_statement"],
        workplaceReputation: json["workplace_reputation"],
    );

    Map<String, dynamic> toJson() => {
        "business_report": businessReport,
        "employment_business_duration": employmentBusinessDuration,
        "payment_receipt_method": paymentReceiptMethod,
        "business_premises_status": businessPremisesStatus,
        "sales_method": salesMethod,
        "employee_count": employeeCount,
        "business_administration": businessAdministration,
        "business_liabilities": businessLiabilities,
        "employment_status": employmentStatus,
        "employer_credibility": employerCredibility,
        "salary_slip": salarySlip,
        "account_statement": accountStatement,
        "workplace_reputation": workplaceReputation,
    };
}
