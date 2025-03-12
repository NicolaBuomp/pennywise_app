import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState {
  final bool isLoading;
  final User? user;
  final String? errorMessage;
  final bool pendingConfirmation;

  AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
    this.pendingConfirmation = false,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? errorMessage,
    bool? pendingConfirmation,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      pendingConfirmation: pendingConfirmation ?? this.pendingConfirmation,
    );
  }
}
