import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier{
  // Variáveis para controlar a visibilidade das senhas
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  bool get isPasswordObscure => _isPasswordObscure;
  bool get isConfirmPasswordObscure => _isConfirmPasswordObscure;

  void togglePasswordVisibility() {
    _isPasswordObscure = !_isPasswordObscure;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
    notifyListeners();
  }

  Future<void> login(String email, String password, String text) async {
    // Chamar API de login aqui

    print('Login: $email, $password');
  }

  Future<void> register({
    required String nome,
    required String email,
    required String password,
    required String dob,
    required String phone,
    required String userType,
  }) async {
    // Chamar API de registro aqui

    print('Register: $nome, $email, $userType'); 
  }
}