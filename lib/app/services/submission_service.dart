import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubmissionService {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> fetchFinancialData(String applicantId) async {
    try {
      final financialData = await supabase
          .from('financial_data')
          .select()
          .eq('applicant_id', applicantId)
          .maybeSingle();

      return {"financial_data": financialData};
    } catch (e) {
      if (kDebugMode) {
        print("Error in fetchFinancialData: $e");
      }
      throw Exception("Gagal mengambil data: $e");
    }
  }

  Future<String> postFinancingApplications({
    required String applicantId,
    required String accountOfficerId,
    required String applicationAmount,
    required String allocation,
    required String officeBranch,
    required String memberStatus,
    required String applicationStatus,
  }) async {
    try {
      final response = await supabase.from('financing_applications').insert([
        {
          'applicant_id': applicantId,
          'account_officer_id': accountOfficerId,
          'application_amount': applicationAmount,
          'allocation': allocation,
          'office_branch': officeBranch,
          'member_status': memberStatus,
          'application_status': applicationStatus,
        }
      ]).select('id');

      return response.first['id'].toString();
    } catch (e) {
      if (kDebugMode) {
        print("Error in postFinancialData: $e");
      }
      throw Exception("Gagal mengirim data: $e");
    }
  }

  Future<Map<String, dynamic>> fetchFinancingApplication(String id) async {
    try {
      final financingApplication = await supabase
          .from('financing_applications')
          .select('*')
          .eq('id', id)
          .single();

      final applicantId = financingApplication['applicant_id'];

      final applicant = await supabase
          .from('applicants')
          .select('name')
          .eq('id', applicantId)
          .single();

      return {
        'financing_application': financingApplication,
        'applicant': applicant,
      };
    } catch (e) {
      if (kDebugMode) {
        print("Error in fetchFinancingApplication: $e");
      }
      throw Exception("Gagal mengambil data: $e");
    }
  }
}
