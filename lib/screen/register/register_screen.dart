import 'package:blueraycargo/screen/register/register_verification_screen.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/theme.dart';
import '../../component/loading.dart';
import '../../provider/auth_provider.dart';
import '../../provider/state/data_state.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fieldTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fieldTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.read<AuthProvider>();

    goToVerifyCode() {
      Navigator.pushNamed(
        context,
        RegisterVerificationScreen.routeName,
        arguments: {
          RegisterVerificationScreen.argsUserId: _fieldTextController.text,
        },
      );
    }

    onSubmit() async {
      final userId = _fieldTextController.text;
      if (userId.isValidEmail() == false && userId.isNumeric() == false) {
        showSnackBar(context, 'Format email tidak valid');
        return;
      }
      if (userId.isNumeric() && userId.length < 11) {
        showSnackBar(context, 'Format nomor telepon tidak valid');
        return;
      }

      await context.read<AuthProvider>().registerMini(userId: userId);
      if (authProvider.isRegister == true) {
        goToVerifyCode();
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
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pendaftaran',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Silahkan isi data dengan benar untuk membuat akun',
              style: textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 64),
            TextField(
              controller: _fieldTextController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              decoration: textFieldDecoration(
                context: context,
                hint: 'Email atau nomor telepon',
              ),
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
                        'Daftar',
                        style: textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
