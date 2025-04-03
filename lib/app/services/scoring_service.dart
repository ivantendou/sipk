import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ScoringService {
  final supabase = Supabase.instance.client;

  Future<String> createForm({required String userId}) async {
    final List<Map<String, dynamic>> applicantId =
        await supabase.from('applicants').insert([
      {'account_officer_id': userId},
    ]).select('id');

    if (applicantId.isEmpty || !applicantId.first.containsKey('id')) {
      throw Exception("Gagal mendapatkan ID");
    }

    return applicantId.first['id'].toString();
  }

  Future<void> deleteForm({required String applicantId}) async {
    await supabase.from('applicants').delete().eq('id', applicantId);
  }

  Future<void> updateFirstStep({
    required String applicantId,
    required String? applicantName,
    required String? applicantCategory,
    required String? ktpAddress,
    required String? residentialAddress,
    required String? regency,
    required String? province,
    required String? postalCode,
    required String? placeOfBirth,
    required String? dateOfBirth,
    required String? applicantAge,
    required String? ktpNumber,
    required String? motherName,
    required String? homePhone,
    required String? mobilePhone,
    required String? gender,
    required String? educationLevel,
    required String? selfEmploymentType,
    required String? employmentType,
    required String? companyName,
    required String? companyAddress,
    required String? bossName,
    required String? maritalStatus,
    required String? spouseName,
    required String? spouseMotherName,
    required String? spouseAddress,
    required String? spouseKtpNumber,
    required String? spousePlaceOfBirth,
    required String? spouseDateOfBirth,
    required String? spouseOccupation,
    required String? dependentsCount,
    required String? childCount,
    required bool? isEmployee,
  }) async {
    try {
      await supabase.from('applicants').update({
        'name': applicantName,
        'ktp_number': ktpNumber,
        'residential_address': residentialAddress,
        'regency': regency,
        'province': province,
        'postal_code': postalCode,
        'place_of_birth': placeOfBirth,
        'date_of_birth': dateOfBirth,
        'mother_name': motherName,
        'home_phone': homePhone,
        'mobile_phone': mobilePhone,
        'gender': gender,
        'ktp_address': ktpAddress,
        'company_name': companyName,
        'company_address': companyAddress,
        'boss_name': bossName
      }).eq('id', applicantId);

      await supabase.from('credit_evaluations').update({
        'applicant_age': applicantAge,
        'applicant_category': applicantCategory,
        'marital_status': maritalStatus,
        'dependents_count': dependentsCount,
        'education_level': educationLevel,
        'self_employment_type': selfEmploymentType,
        'employment_type': employmentType,
        'is_employee': isEmployee,
      }).eq('applicant_id', applicantId);

      await supabase.from('spouses').update({
        'name': spouseName,
        'ktp_number': spouseKtpNumber,
        'place_of_birth': spousePlaceOfBirth,
        'date_of_birth': spouseDateOfBirth,
        'occupation': spouseOccupation,
        'mother_name': spouseMotherName,
        'address': spouseAddress,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateFirstStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateSecondStep({
    required String applicantId,
    required String? financingType,
    required String? applicationAmount,
    required String? allocation,
    required String? downPaymentPct,
    required String? downPaymentAmt,
    required String? financingIteration,
  }) async {
    try {
      await supabase.from('financing_applications').update({
        'financing_type': financingType,
        'application_amount': applicationAmount,
        'down_payment_pct': downPaymentPct,
        'down_payment_amt': downPaymentAmt,
        'allocation': allocation,
      }).eq('applicant_id', applicantId);

      await supabase.from('credit_evaluations').update({
        'financing_iteration': financingIteration,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateSecondStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateThirdStep({
    required String applicantId,
    required String? netSalaryApplicant,
    required String? netSalarySpouse,
    required String? netBusinessIncomeApplicant,
    required String? netBusinessIncomeSpouse,
    required String? householdExpense,
    required String? transportationExpense,
    required String? communicationExpense,
    required String? educationExpense,
    required String? utilityBills,
    required String? ongoingInstallment,
    required String? entertainmentExpense,
    required double? financingTerm,
    required String? ekvRate,
    required String? installmentType,
  }) async {
    try {
      await supabase.from('financial_data').update({
        'net_salary_applicant': netSalaryApplicant,
        'net_salary_spouse': netSalarySpouse,
        'net_business_income_applicant': netBusinessIncomeApplicant,
        'net_business_income_spouse': netBusinessIncomeSpouse,
        'household_expense': householdExpense,
        'transportation_expense': transportationExpense,
        'communication_expense': communicationExpense,
        'education_expense': educationExpense,
        'utility_bills': utilityBills,
        'ongoing_installment': ongoingInstallment,
        'entertainment_social_expense': entertainmentExpense,
        'ekv_rate': ekvRate,
        'installment_type': installmentType,
      }).eq('applicant_id', applicantId);

      await supabase.from('credit_evaluations').update({
        'financing_term': financingTerm,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateThirdStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateFourthStep({
    required String applicantId,
    required String? businessReport,
    required double? employmentBusinessDuration,
    required String? paymentReceiptMethod,
    required String? businessPremisesStatus,
    required String? salesMethod,
    required String? employeeCount,
    required String? businessAdministration,
    required String? businessLiabilities,
    required String? employmentStatus,
    required String? employerCredibility,
    required String? salarySlip,
    required String? accountStatement,
    required String? workplaceReputation,
  }) async {
    try {
      await supabase.from('credit_evaluations').update({
        'business_report': businessReport,
        'employment_business_duration': employmentBusinessDuration,
        'payment_receipt_method': paymentReceiptMethod,
        'business_premises_status': businessPremisesStatus,
        'sales_method': salesMethod,
        'employee_count': employeeCount,
        'business_administration': businessAdministration,
        'business_liabilities': businessLiabilities,
        'employment_status': employmentStatus,
        'employer_credibility': employerCredibility,
        'salary_slip': salarySlip,
        'account_statement': accountStatement,
        'workplace_reputation': workplaceReputation,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateFourthStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateFifthStep({
    required String applicantId,
    required double? sales,
    required double? cogs,
    required double? dailyLabor,
    required double? consumption,
    required double? transportCost,
    required double? fuel,
    required double? packaging,
    required double? depreciation,
    required double? otherCosts,
    required double? activeDays,
    required double? monthlyLabor,
    required double? rental,
    required double? assetMaintenance,
    required double? utilities,
  }) async {
    try {
      await supabase.from('business_financial_details').update({
        'sales': sales,
        'cogs': cogs,
        'daily_labor': dailyLabor,
        'consumption': consumption,
        'transport_costs': transportCost,
        'fuel': fuel,
        'packaging': packaging,
        'depreciation': depreciation,
        'other_costs': otherCosts,
        'active_days': activeDays,
        'monthly_labor': monthlyLabor,
        'rental': rental,
        'asset_maintenance': assetMaintenance,
        'utilities': utilities,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateFifthStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateSixStep({
    required String applicantId,
    required String? residenceOwnership,
    required String? residenceDuration,
    required String? neighborhoodReputation,
  }) async {
    try {
      await supabase.from('credit_evaluations').update({
        'residence_ownership': residenceOwnership,
        'residence_duration': residenceDuration,
        'neighborhood_reputation': neighborhoodReputation,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateSixStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateSevenStep({
    required String applicantId,
    required String? bankingRelationship,
    required String? averageMonthlyBalance,
    required String? averageTransactionFrequency,
    required String? applicantCreditQuality,
    required String? applicantCreditRating,
    required String? spouseCreditRating,
  }) async {
    try {
      await supabase.from('credit_evaluations').update({
        'banking_relationship': bankingRelationship,
        'average_monthly_balance': averageMonthlyBalance,
        'average_transaction_frequency': averageTransactionFrequency,
        'applicant_credit_quality': applicantCreditQuality,
        'applicant_credit_rating': applicantCreditRating,
        'spouse_credit_rating': spouseCreditRating,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateSevenStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }

  Future<void> updateEightStep({
    required String applicantId,
    required String? applicationCoverage,
    required String? vehicleCollateralInsurance,
    required String? applicantLifeInsurance,
    required String? collateralBinding,
  }) async {
    try {
      await supabase.from('credit_evaluations').update({
        'application_coverage': applicationCoverage,
        'vehicle_collateral_insurance': vehicleCollateralInsurance,
        'applicant_life_insurance': applicantLifeInsurance,
        'collateral_binding': collateralBinding,
      }).eq('applicant_id', applicantId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in updateEightStep: $e");
      }
      throw Exception("Gagal mengupdate data: $e");
    }
  }
}
