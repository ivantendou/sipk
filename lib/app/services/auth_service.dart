import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) async {
    AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return res;
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
