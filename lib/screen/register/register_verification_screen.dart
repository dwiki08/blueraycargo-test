import 'package:blueraycargo/screen/register/register_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/theme.dart';
import '../../component/loading.dart';
import '../../provider/auth_provider.dart';
import '../../provider/state/data_state.dart';

class RegisterVerificationScreen extends StatefulWidget {
  static const routeName = '/register-verification';
  static const argsUserId = 'userId';

  const RegisterVerificationScreen({super.key});

  @override
  State<RegisterVerificationScreen> createState() =>
      _RegisterVerificationScreenState();
}

class _RegisterVerificationScreenState
    extends State<RegisterVerificationScreen> {
  final _fieldTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fieldTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final userId = args[RegisterVerificationScreen.argsUserId] ?? '';
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.read<AuthProvider>();

    goToRegisterPassword() {
      Navigator.popAndPushNamed(
        context,
        RegisterPasswordScreen.routeName,
        arguments: {RegisterPasswordScreen.argsUserId: userId},
      );
    }

    onSubmit() async {
      await authProvider.registerVerifyCode(
        userId: userId,
        code: _fieldTextController.text.toUpperCase(),
      );
      if (authProvider.isRegister == true) {
        goToRegisterPassword();
      } else {
        showSnackBar(
          context,
          authProvider.error?.message ?? 'Terjadi kesalahan',
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Verifikasi Kontak',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.bodyMedium,
                  children: [
                    const TextSpan(
                      text:
                          'Masukkan kode verifikasi yang telah kami kirim ke ',
                    ),
                    TextSpan(
                      text: userId,
                      style: const TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64),
              TextField(
                controller: _fieldTextController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: textFieldDecoration(
                  context: context,
                  hint: 'Kode verifikasi',
                ),
                textCapitalization: TextCapitalization.characters,
                maxLength: 6,
              ),
              SizedBox(height: 32),
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  if (value.state == DataState.isLoading) {
                    return const Loading();
                  } else {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: primaryButtonStyle(
                          enabled: value.state != DataState.isLoading,
                        ),
                        onPressed: () => onSubmit(),
                        child: Text(
                          'Verifikasi Kode',
                          style: textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 64),
              Text('Tidak menerima kode verifikasi?'),
              InkWell(
                child: Text(
                  'Kirim ulang',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
