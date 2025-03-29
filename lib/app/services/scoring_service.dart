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
      if (kDebugMode) {
        print("Updating First Step with data:");
        print("Applicant ID: $applicantId");
      }

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
        'is_employee': isEmployee,
      }).eq('applicant_id', applicantId);

      // Update spouses table
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
}
