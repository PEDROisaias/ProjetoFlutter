import 'package:aurelia_app/ui/view_model/auth_view_model.dart';
import 'package:aurelia_app/ui/widgets/auth_logo_header.dart';
import 'package:aurelia_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin(AuthViewModel viewModel) {
    if (_formKey.currentState?.validate() ?? false) {
      viewModel.login(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const AuthLogoHeader(),
                      const SizedBox(height: 40),

                      CustomTextField(
                        controller: _nameController, 
                        labelText: 'Nome',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _emailController, 
                        labelText: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Por favor, insira seu email';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(val)) {
                            return 'Por favor, insira um email válido';
                          }
                          return null;
                        },
                      ),

                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Senha',
                        obscureText: viewModel.isPasswordObscure,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          if (val.length < 6) {
                            return 'A senha deve ter pelo menos 6 caracteres';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                      ),
                      const SizedBox(height: 32),

                      ElevatedButton(
                        onPressed: () => _submitLogin(viewModel), 
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ainda não tem uma conta?', 
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/register');
                            },
                            child: const Text(
                              'Clique aqui',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}