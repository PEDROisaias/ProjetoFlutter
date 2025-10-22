import 'package:aurelia_app/ui/view_model/auth_view_model.dart';
import 'package:aurelia_app/ui/widgets/auth_logo_header.dart';
import 'package:aurelia_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _selectedUserType;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dateOfBirthController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _selectedDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateOfBirthController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  // void _submitRegister(AuthViewModel viewModel) {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     viewModel.register(
  //       nome: _nameController.text,
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //       dob: _dateOfBirthController.text,
  //       phone: _phoneController.text,
  //       userType: _selectedUserType!,
  //     );
  //   }
  // }

  void _submitRegister() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Cadastro realizado com sucesso');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            body: Center(
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
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _emailController,
                        labelText: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Senha',
                        obscureText: viewModel.isPasswordObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: viewModel.togglePasswordVisibility,
                        ),
                      ),

                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _confirmPasswordController,
                        labelText: 'Confirmar Senha',
                        obscureText: viewModel.isConfirmPasswordObscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isConfirmPasswordObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: viewModel.toggleConfirmPasswordVisibility,
                        ),
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _dateOfBirthController,
                        labelText: 'Data de Nascimento',
                        readOnly: true,
                        onTap: _selectedDate,
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _phoneController,
                        labelText: 'Telefone',
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        value: _selectedUserType,
                        hint: const Text('Tipo de Usuário'),
                        decoration: const InputDecoration(),
                        items: ['Paciente', 'Cuidador'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() => _selectedUserType = newValue);
                        },
                        validator: (value) => value == null
                            ? 'Por favor, selecione um tipo de usuário'
                            : null,
                      ),
                      const SizedBox(height: 32),

                      ElevatedButton(
                        onPressed: () => _submitRegister(),
                        child: const Text('Cadastrar'),
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Já tem uma conta?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: const Text('Clique aqui'),
                          ),
                        ],
                      ),
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
