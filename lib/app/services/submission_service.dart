import 'package:flutter/foundation.dart';
import 'package:sipk/models/financing_applications_model.dart';
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

  Future<void> deleteSubmissions(List<String> dataIds) async {
    if (kDebugMode) {
      print(dataIds);
    }
    await Future.wait(dataIds.map((dataId) async {
      await supabase.from('financing_applications').delete().eq('id', dataId);
    }));
  }

  Future<void> deleteSubmission(String dataId) async {
    await supabase.from('financing_applications').delete().eq('id', dataId);
  }

  Future<String> postFinancingApplications({
    required String applicantId,
    required String accountOfficerId,
    required String applicationAmount,
    required String allocation,
    required String officeBranch,
    required String memberStatus,
    required String applicationStatus,
    required String name,
    required String ktpNumber,
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
          'name': name,
          'ktp_number': ktpNumber,
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

  Future<List<FinancingApplicationsModel>> fetchFinancingApplications(
      {required String searchQuery,
      required String accountOfficerId,
      required int from,
      required int to,
      required bool ascending,
      required String applicationStatus}) async {
    try {
      final List<Map<String, dynamic>> response = await supabase
          .from('financing_applications')
          .select('*')
          .or('name.ilike.%$searchQuery%,ktp_number.ilike.%$searchQuery%')
          .eq('account_officer_id', accountOfficerId)
          .filter('application_status', 'eq', applicationStatus)
          .order('created_at', ascending: ascending)
          .range(from, to);

      return response
          .map((json) => FinancingApplicationsModel.fromJson(json))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error in fetchFinancingApplications: $e');
      }
      throw Exception('Failed to fetch data: ${e.toString()}');
    }
  }

  Future<List<FinancingApplicationsModel>> fetchFinancingApplicationsAdmin(
      {required String searchQuery,
      required int from,
      required int to,
      required bool ascending,
      required String applicationStatus}) async {
    try {
      final List<Map<String, dynamic>> response = await supabase
          .from('financing_applications')
          .select('*')
          .or('name.ilike.%$searchQuery%,ktp_number.ilike.%$searchQuery%')
          .filter('application_status', 'eq', applicationStatus)
          .order('created_at', ascending: ascending)
          .range(from, to);

      return response
          .map((json) => FinancingApplicationsModel.fromJson(json))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error in fetchFinancingApplicationsAdmin: $e');
      }
      throw Exception('Failed to fetch data: ${e.toString()}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchMonthlyFinancingApplications(
      String userId) async {
    try {
      final now = DateTime.now();
      final startOfMonth = DateTime(now.year, now.month, 1).toIso8601String();
      final endOfMonth = DateTime(now.year, now.month + 1, 1).toIso8601String();

      final applications = await supabase
          .from('financing_applications')
          .select('*')
          .eq('account_officer_id', userId)
          .gte('created_at', startOfMonth)
          .lt('created_at', endOfMonth)
          .order('created_at', ascending: false);

      List<Map<String, dynamic>> result = [];

      for (var application in applications) {
        final applicantId = application['applicant_id'];

        final applicant = await supabase
            .from('applicants')
            .select('name')
            .eq('id', applicantId)
            .single();

        result.add({
          'financing_application': application,
          'applicant': applicant,
        });
      }

      return result;
    } catch (e) {
      throw Exception("Gagal mengambil data pengajuan: $e");
    }
  }

  Future<void> rejectSubmission(String applicationId) async {
    try {
      await supabase
          .from('financing_applications')
          .update({'application_status': 'Rejected'}).eq('id', applicationId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in rejectSubmission: $e");
      }
      throw Exception("Gagal mengirim data: $e");
    }
  }

  Future<void> acceptSubmission(String applicationId) async {
    try {
      await supabase
          .from('financing_applications')
          .update({'application_status': 'Accepted'}).eq('id', applicationId);
    } catch (e) {
      if (kDebugMode) {
        print("Error in acceptSubmission: $e");
      }
      throw Exception("Gagal mengirim data: $e");
    }
  }
}
