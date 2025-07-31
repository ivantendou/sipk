// To parse this JSON data, do
//
//     final financingProposalModel = financingProposalModelFromJson(jsonString);

import 'dart:convert';

FinancingProposalModel financingProposalModelFromJson(String str) =>
    FinancingProposalModel.fromJson(json.decode(str));

String financingProposalModelToJson(FinancingProposalModel data) =>
    json.encode(data.toJson());

class FinancingProposalModel {
  FinancingApplication? financingApplication;
  Applicant? applicant;
  CreditEvaluation? creditEvaluation;
  CreditScore? creditScore;
  FinancialData? financialData;
  FinancingData? financingData;
  Spouse? spouse;
  AccountOfficer? accountOfficer;

  FinancingProposalModel({
    this.financingApplication,
    this.applicant,
    this.creditEvaluation,
    this.creditScore,
    this.financialData,
    this.financingData,
    this.spouse,
    this.accountOfficer,
  });

  factory FinancingProposalModel.fromJson(Map<String, dynamic> json) =>
      FinancingProposalModel(
        financingApplication: json["financing_application"] == null
            ? null
            : FinancingApplication.fromJson(json["financing_application"]),
        applicant: json["applicant"] == null
            ? null
            : Applicant.fromJson(json["applicant"]),
        creditEvaluation: json["credit_evaluation"] == null
            ? null
            : CreditEvaluation.fromJson(json["credit_evaluation"]),
        creditScore: json["credit_score"] == null
            ? null
            : CreditScore.fromJson(json["credit_score"]),
        financialData: json["financial_data"] == null
            ? null
            : FinancialData.fromJson(json["financial_data"]),
        financingData: json["financing_data"] == null
            ? null
            : FinancingData.fromJson(json["financing_data"]),
        spouse: json["spouse"] == null ? null : Spouse.fromJson(json["spouse"]),
        accountOfficer: json["account_officer"] == null
            ? null
            : AccountOfficer.fromJson(json["account_officer"]),
      );

  Map<String, dynamic> toJson() => {
        "financing_application": financingApplication?.toJson(),
        "applicant": applicant?.toJson(),
        "credit_evaluation": creditEvaluation?.toJson(),
        "credit_score": creditScore?.toJson(),
        "financial_data": financialData?.toJson(),
        "financing_data": financingData?.toJson(),
        "spouse": spouse?.toJson(),
        "account_officer": accountOfficer?.toJson(),
      };
}

class AccountOfficer {
  String? fullName;

  AccountOfficer({
    this.fullName,
  });

  factory AccountOfficer.fromJson(Map<String, dynamic> json) => AccountOfficer(
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
      };
}

class Applicant {
  String? accountOfficerId;
  String? name;
  String? ktpNumber;
  String? residentialAddress;
  String? regency;
  String? province;
  String? postalCode;
  String? placeOfBirth;
  DateTime? dateOfBirth;
  String? motherName;
  String? homePhone;
  String? mobilePhone;
  String? gender;
  int? id;
  String? ktpAddress;
  String? companyName;
  String? companyAddress;
  String? bossName;
  DateTime? createdAt;

  Applicant({
    this.accountOfficerId,
    this.name,
    this.ktpNumber,
    this.residentialAddress,
    this.regency,
    this.province,
    this.postalCode,
    this.placeOfBirth,
    this.dateOfBirth,
    this.motherName,
    this.homePhone,
    this.mobilePhone,
    this.gender,
    this.id,
    this.ktpAddress,
    this.companyName,
    this.companyAddress,
    this.bossName,
    this.createdAt,
  });

  factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        accountOfficerId: json["account_officer_id"],
        name: json["name"],
        ktpNumber: json["ktp_number"],
        residentialAddress: json["residential_address"],
        regency: json["regency"],
        province: json["province"],
        postalCode: json["postal_code"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        motherName: json["mother_name"],
        homePhone: json["home_phone"],
        mobilePhone: json["mobile_phone"],
        gender: json["gender"],
        id: json["id"],
        ktpAddress: json["ktp_address"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        bossName: json["boss_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "account_officer_id": accountOfficerId,
        "name": name,
        "ktp_number": ktpNumber,
        "residential_address": residentialAddress,
        "regency": regency,
        "province": province,
        "postal_code": postalCode,
        "place_of_birth": placeOfBirth,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "mother_name": motherName,
        "home_phone": homePhone,
        "mobile_phone": mobilePhone,
        "gender": gender,
        "id": id,
        "ktp_address": ktpAddress,
        "company_name": companyName,
        "company_address": companyAddress,
        "boss_name": bossName,
        "created_at": createdAt?.toIso8601String(),
      };
}

class CreditEvaluation {
  int? applicantAge;
  String? applicantCategory;
  String? maritalStatus;
  int? dependentsCount;
  String? educationLevel;
  String? residenceOwnership;
  int? residenceDuration;
  String? neighborhoodReputation;
  String? selfEmploymentType;
  String? employmentType;
  String? employmentStatus;
  String? employerCredibility;
  String? salarySlip;
  String? accountStatement;
  String? workplaceReputation;
  String? businessReport;
  int? employmentBusinessDuration;
  String? paymentReceiptMethod;
  String? businessPremisesStatus;
  String? salesMethod;
  int? employeeCount;
  String? businessAdministration;
  String? businessLiabilities;
  String? bankingRelationship;
  String? averageMonthlyBalance;
  String? averageTransactionFrequency;
  String? applicantCreditQuality;
  String? applicantCreditRating;
  String? spouseCreditRating;
  double? totalIncomeRatio;
  double? powerSavingRatio;
  int? financingTerm;
  int? financingIteration;
  String? applicationCoverage;
  String? vehicleCollateralInsurance;
  String? applicantLifeInsurance;
  String? collateralBinding;
  bool? isEmployee;
  int? id;
  int? applicantId;
  DateTime? createdAt;
  num? maxAffordableInstallment;
  num? maxPossibleFinancing;

  CreditEvaluation({
    this.applicantAge,
    this.applicantCategory,
    this.maritalStatus,
    this.dependentsCount,
    this.educationLevel,
    this.residenceOwnership,
    this.residenceDuration,
    this.neighborhoodReputation,
    this.selfEmploymentType,
    this.employmentType,
    this.employmentStatus,
    this.employerCredibility,
    this.salarySlip,
    this.accountStatement,
    this.workplaceReputation,
    this.businessReport,
    this.employmentBusinessDuration,
    this.paymentReceiptMethod,
    this.businessPremisesStatus,
    this.salesMethod,
    this.employeeCount,
    this.businessAdministration,
    this.businessLiabilities,
    this.bankingRelationship,
    this.averageMonthlyBalance,
    this.averageTransactionFrequency,
    this.applicantCreditQuality,
    this.applicantCreditRating,
    this.spouseCreditRating,
    this.totalIncomeRatio,
    this.powerSavingRatio,
    this.financingTerm,
    this.financingIteration,
    this.applicationCoverage,
    this.vehicleCollateralInsurance,
    this.applicantLifeInsurance,
    this.collateralBinding,
    this.isEmployee,
    this.id,
    this.applicantId,
    this.createdAt,
    this.maxAffordableInstallment,
    this.maxPossibleFinancing,
  });

  factory CreditEvaluation.fromJson(Map<String, dynamic> json) =>
      CreditEvaluation(
        applicantAge: json["applicant_age"],
        applicantCategory: json["applicant_category"],
        maritalStatus: json["marital_status"],
        dependentsCount: json["dependents_count"],
        educationLevel: json["education_level"],
        residenceOwnership: json["residence_ownership"],
        residenceDuration: json["residence_duration"],
        neighborhoodReputation: json["neighborhood_reputation"],
        selfEmploymentType: json["self_employment_type"],
        employmentType: json["employment_type"],
        employmentStatus: json["employment_status"],
        employerCredibility: json["employer_credibility"],
        salarySlip: json["salary_slip"],
        accountStatement: json["account_statement"],
        workplaceReputation: json["workplace_reputation"],
        businessReport: json["business_report"],
        employmentBusinessDuration: json["employment_business_duration"],
        paymentReceiptMethod: json["payment_receipt_method"],
        businessPremisesStatus: json["business_premises_status"],
        salesMethod: json["sales_method"],
        employeeCount: json["employee_count"],
        businessAdministration: json["business_administration"],
        businessLiabilities: json["business_liabilities"],
        bankingRelationship: json["banking_relationship"],
        averageMonthlyBalance: json["average_monthly_balance"],
        averageTransactionFrequency: json["average_transaction_frequency"],
        applicantCreditQuality: json["applicant_credit_quality"],
        applicantCreditRating: json["applicant_credit_rating"],
        spouseCreditRating: json["spouse_credit_rating"],
        totalIncomeRatio: json["total_income_ratio"]?.toDouble(),
        powerSavingRatio: json["power_saving_ratio"]?.toDouble(),
        financingTerm: json["financing_term"],
        financingIteration: json["financing_iteration"],
        applicationCoverage: json["application_coverage"],
        vehicleCollateralInsurance: json["vehicle_collateral_insurance"],
        applicantLifeInsurance: json["applicant_life_insurance"],
        collateralBinding: json["collateral_binding"],
        isEmployee: json["is_employee"],
        id: json["id"],
        applicantId: json["applicant_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        maxAffordableInstallment: json["max_affordable_installment"],
        maxPossibleFinancing: json["max_possible_financing"],
      );

  Map<String, dynamic> toJson() => {
        "applicant_age": applicantAge,
        "applicant_category": applicantCategory,
        "marital_status": maritalStatus,
        "dependents_count": dependentsCount,
        "education_level": educationLevel,
        "residence_ownership": residenceOwnership,
        "residence_duration": residenceDuration,
        "neighborhood_reputation": neighborhoodReputation,
        "self_employment_type": selfEmploymentType,
        "employment_type": employmentType,
        "employment_status": employmentStatus,
        "employer_credibility": employerCredibility,
        "salary_slip": salarySlip,
        "account_statement": accountStatement,
        "workplace_reputation": workplaceReputation,
        "business_report": businessReport,
        "employment_business_duration": employmentBusinessDuration,
        "payment_receipt_method": paymentReceiptMethod,
        "business_premises_status": businessPremisesStatus,
        "sales_method": salesMethod,
        "employee_count": employeeCount,
        "business_administration": businessAdministration,
        "business_liabilities": businessLiabilities,
        "banking_relationship": bankingRelationship,
        "average_monthly_balance": averageMonthlyBalance,
        "average_transaction_frequency": averageTransactionFrequency,
        "applicant_credit_quality": applicantCreditQuality,
        "applicant_credit_rating": applicantCreditRating,
        "spouse_credit_rating": spouseCreditRating,
        "total_income_ratio": totalIncomeRatio,
        "power_saving_ratio": powerSavingRatio,
        "financing_term": financingTerm,
        "financing_iteration": financingIteration,
        "application_coverage": applicationCoverage,
        "vehicle_collateral_insurance": vehicleCollateralInsurance,
        "applicant_life_insurance": applicantLifeInsurance,
        "collateral_binding": collateralBinding,
        "is_employee": isEmployee,
        "id": id,
        "applicant_id": applicantId,
        "created_at": createdAt?.toIso8601String(),
        "max_affordable_installment": maxAffordableInstallment,
        "max_possible_financing": maxPossibleFinancing,
      };
}

class CreditScore {
  String? id;
  double? totalScore;
  bool? isDraft;
  int? evaluationId;
  DateTime? updatedAt;
  DateTime? createdAt;

  CreditScore({
    this.id,
    this.totalScore,
    this.isDraft,
    this.evaluationId,
    this.updatedAt,
    this.createdAt,
  });

  factory CreditScore.fromJson(Map<String, dynamic> json) => CreditScore(
        id: json["id"],
        totalScore: json["total_score"]?.toDouble(),
        isDraft: json["is_draft"],
        evaluationId: json["evaluation_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_score": totalScore,
        "is_draft": isDraft,
        "evaluation_id": evaluationId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
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

class FinancingApplication {
  int? id;
  DateTime? createdAt;
  String? accountOfficerId;
  int? applicantId;
  String? officeBranch;
  String? memberStatus;
  String? allocation;
  num? applicationAmount;
  String? applicationStatus;
  dynamic updatedAt;
  String? name;
  String? ktpNumber;
  String? remarks;
  num? acceptedAmount;

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
    this.name,
    this.ktpNumber,
    this.remarks,
    this.acceptedAmount,
  });

  factory FinancingApplication.fromJson(Map<String, dynamic> json) =>
      FinancingApplication(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
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
        remarks: json["remarks"],
        acceptedAmount: json["accepted_amount"],
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
        "remarks": remarks,
        "accepted_amount": acceptedAmount,
      };
}

class FinancingData {
  int? id;
  int? applicantId;
  String? financingType;
  num? applicationAmount;
  num? downPaymentPct;
  num? downPaymentAmt;
  String? allocation;

  FinancingData({
    this.id,
    this.applicantId,
    this.financingType,
    this.applicationAmount,
    this.downPaymentPct,
    this.downPaymentAmt,
    this.allocation,
  });

  factory FinancingData.fromJson(Map<String, dynamic> json) => FinancingData(
        id: json["id"],
        applicantId: json["applicant_id"],
        financingType: json["financing_type"],
        applicationAmount: json["application_amount"],
        downPaymentPct: json["down_payment_pct"],
        downPaymentAmt: json["down_payment_amt"],
        allocation: json["allocation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicant_id": applicantId,
        "financing_type": financingType,
        "application_amount": applicationAmount,
        "down_payment_pct": downPaymentPct,
        "down_payment_amt": downPaymentAmt,
        "allocation": allocation,
      };
}

class Spouse {
  int? id;
  int? applicantId;
  String? name;
  String? ktpNumber;
  String? placeOfBirth;
  DateTime? dateOfBirth;
  String? occupation;
  String? motherName;
  String? address;

  Spouse({
    this.id,
    this.applicantId,
    this.name,
    this.ktpNumber,
    this.placeOfBirth,
    this.dateOfBirth,
    this.occupation,
    this.motherName,
    this.address,
  });

  factory Spouse.fromJson(Map<String, dynamic> json) => Spouse(
        id: json["id"],
        applicantId: json["applicant_id"],
        name: json["name"],
        ktpNumber: json["ktp_number"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        occupation: json["occupation"],
        motherName: json["mother_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicant_id": applicantId,
        "name": name,
        "ktp_number": ktpNumber,
        "place_of_birth": placeOfBirth,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "occupation": occupation,
        "mother_name": motherName,
        "address": address,
      };
}
