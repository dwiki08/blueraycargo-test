import 'package:blueraycargo/component/form_field.dart';
import 'package:blueraycargo/component/loading.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/theme.dart';
import '../../provider/auth_provider.dart';
import '../../provider/state/data_state.dart';
import '../login/login_screen.dart';

class RegisterProfileScreen extends StatefulWidget {
  static const routeName = '/register-profile';
  static const argsUserId = 'userId';
  static const argsPassword = 'password';

  const RegisterProfileScreen({super.key});

  @override
  State<RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

class _RegisterProfileScreenState extends State<RegisterProfileScreen> {
  final _userIdTextController = TextEditingController();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userIdTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.read<AuthProvider>();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final userId = args[RegisterProfileScreen.argsUserId] ?? '';
    final password = args[RegisterProfileScreen.argsPassword] ?? '';

    _userIdTextController.text = userId;

    goToLogin() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }

    onSubmit() async {
      final firstName = _firstNameTextController.text;
      final lastName = _lastNameTextController.text;
      if (firstName.isEmpty || lastName.isEmpty) {
        showSnackBar(context, 'Mohon isi semua kolom');
        return;
      }
      await authProvider.registerMandatory(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        password: password,
      );
      if (authProvider.isRegister == true) {
        goToLogin();
        showSnackBar(
          context,
          'Pendaftaran akun sudah selesai. Silahkan login.',
        );
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
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(height: 32),
            SvgPicture.asset(
              assetsIcons('profile.svg'),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 24),
            formField(
              textController: _userIdTextController,
              context: context,
              label: userId.isValidEmail() ? 'Email' : 'Nomor Telepon',
              hint: userId.isValidEmail() ? 'Masukkan email Anda' : '08xxxx',
              enabled: false,
            ),
            formField(
              textController: _firstNameTextController,
              context: context,
              label: 'Nama Depan',
              hint: 'Masukkan nama depan',
              keyboardType: TextInputType.name,
            ),
            formField(
              textController: _lastNameTextController,
              context: context,
              label: 'Nama Belakang',
              hint: 'Masukkan nama belakang',
              keyboardType: TextInputType.name,
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
                        'Simpan',
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
