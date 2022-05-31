import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';

enum AuthStatus {
  none,
  error,
  signedIn,
}

class AuthException {
  final String message;
  AuthException(this.message);
}

class AuthProvider extends ChangeNotifier {
  String? verificationId;

  User? _user;
  AuthException? _exception;

  User? get user => _user;
  AuthException? get error => _exception;

  bool get isLoggedIn => _user != null;
  bool get hasError => _exception != null;

  setUser(User user) {
    _user = user;
    _exception = null;
    notifyListeners();
  }

  setError(AuthException exception) {
    _exception = exception;
    notifyListeners();
  }

  clearError() {
    _exception = null;
    notifyListeners();
  }

  clearUser() {
    _user = null;
    notifyListeners();
  }
}

class AuthService {
  static final auth = FirebaseAuth.instance;
  final AuthProvider authProvider = AuthProvider();

  ConfirmationResult? _confirmationResult;

  AuthService() {
    try {
      Future.delayed(Duration.zero).then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          authProvider.setUser(user);
          user.getIdToken().then((value) => print("TOKEN: $value"));
        }
      });
    } catch (err) {
      print(err.toString());
    }
  }

  Future<User?> get currentUser async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> startPhoneNumberVerification({
    required String phoneNumber,
  }) async {
    authProvider.verificationId = null;
    authProvider.clearError();
    authProvider.clearUser();

    String finalPhoneNumber = "+47 $phoneNumber";

    if (Platform.isAndroid || Platform.isIOS) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: finalPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.message != null) {
            print("error: ${e.code}");
            authProvider.setError(AuthException(e.message!));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          authProvider.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String id) {},
      );
    } else {
      _confirmationResult =
          await FirebaseAuth.instance.signInWithPhoneNumber(finalPhoneNumber);
    }
  }

  Future<void> verifyPhoneNumber({required String code}) async {
    authProvider.clearError();

    if (_confirmationResult == null) {
      if (authProvider.verificationId != null && !authProvider.isLoggedIn) {
        try {
          UserCredential credential = await auth.signInWithCredential(
            PhoneAuthProvider.credential(
              verificationId: authProvider.verificationId!,
              smsCode: code,
            ),
          );
          if (credential.user != null) {
            authProvider.setUser(credential.user!);
          }
        } catch (error) {
          authProvider.setError(AuthException(error.toString()));
        }
      }
    } else {
      try {
        UserCredential credential = await _confirmationResult!.confirm(code);
        if (credential.user != null) {
          authProvider.setUser(credential.user!);
        }
      } catch (error) {
        authProvider.setError(AuthException(error.toString()));
      }
    }
  }

  signOut() async {
    await auth.signOut();
    await authProvider.clearUser();
  }
}
