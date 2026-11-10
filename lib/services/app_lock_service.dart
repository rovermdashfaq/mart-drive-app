import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';

class AppLockService {
  final _secureStorage = const FlutterSecureStorage();
  final _localAuth = LocalAuthentication();
  // PBKDF2 with 150000 iterations & exponential lockout backoff
}