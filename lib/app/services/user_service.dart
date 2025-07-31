import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sipk/models/user_model.dart';
import 'package:sipk/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final supabase = Supabase.instance.client;
  final supabaseAuthAdmin = SupabaseClient(
    dotenv.env['PROJECT_URL'] ?? '',
    dotenv.env['SERVICE_ROLE_KEY'] ?? '',
  );

  Future<List<UsersModel>> fetchUsersWithRole({
    required List<String> selectedRolesList,
    required String searchQuery,
    required int from,
    required int to,
  }) async {
    final roleFilters =
        selectedRolesList.map((role) => "role.eq.$role").join(',');
    final res = await supabase
        .from('profiles')
        .select()
        .or(roleFilters)
        .ilike('full_name', '%$searchQuery%')
        .neq('role', 'Admin')
        .order('full_name', ascending: true)
        .range(from, to);
    return res.map((json) => UsersModel.fromJson(json)).toList();
  }

  Future<List<UsersModel>> fetchUsers({
    required String searchQuery,
    required int from,
    required int to,
  }) async {
    final res = await supabase
        .from('profiles')
        .select()
        .ilike('full_name', '%$searchQuery%')
        .neq('role', 'Admin')
        .order('full_name', ascending: true)
        .range(from, to);
    return res.map((json) => UsersModel.fromJson(json)).toList();
  }

  Future<UserModel> fetchUser(String userId) async {
    final res =
        await supabase.from('profiles').select().eq('id', userId).single();
    return UserModel.fromJson(res);
  }

  Future<void> updateUser({
    required String userId,
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
    required String serviceBranch,
  }) async {
    await supabase.from('profiles').update({
      'full_name': name,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'role': role,
      'service_branch': serviceBranch,
    }).eq('id', userId);

    await supabaseAuthAdmin.auth.admin.updateUserById(
      userId,
      attributes: AdminUserAttributes(
        email: email,
        password: password,
      ),
    );
  }

  Future<void> deleteUsers(List<String> userIds) async {
    if (kDebugMode) {
      print(userIds);
    }
    await Future.wait(userIds.map((userId) async {
      await supabaseAuthAdmin.auth.admin.deleteUser(userId);
    }));
  }
}
