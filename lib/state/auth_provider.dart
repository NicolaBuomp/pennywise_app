import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/viewmodels/auth_notifier.dart';
import '../features/auth/viewmodels/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
