import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthState;

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  /// Login con email e password
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(isLoading: false, user: response.user);
    } on AuthException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Si è verificato un errore durante il login',
      );
    }
  }

  /// Registrazione con email e password
  Future<void> register(
    String displayName,
    String email,
    String password,
  ) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      pendingConfirmation: false,
    );
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'display_name': displayName},
      );

      if (response.user != null) {
        state = state.copyWith(
          isLoading: false,
          pendingConfirmation: response.user!.emailConfirmedAt == null,
        );
      } else {
        state = state.copyWith(isLoading: false, pendingConfirmation: true);
      }
    } on AuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
        pendingConfirmation: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Si è verificato un errore durante la registrazione',
        pendingConfirmation: false,
      );
    }
  }

  /// Logout
  Future<void> logout() async {
    await Supabase.instance.client.auth.signOut();
    state = AuthState();
  }
}
