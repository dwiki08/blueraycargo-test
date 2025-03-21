import 'package:blueraycargo/screen/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/theme.dart';
import '../../component/loading.dart';
import '../../provider/auth_provider.dart';
import '../../provider/state/data_state.dart';
import '../dashboard/dahsboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _hidePassword = true;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final authProvider = context.watch<AuthProvider>();

    goToDashboard() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (route) => false,
      );
    }

    doLogin() async {
      await context.read<AuthProvider>().login(
        userId: _emailTextController.text,
        password: _passwordTextController.text,
      );
      if (authProvider.isLoggedIn == true) {
        goToDashboard();
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Silahkan masuk untuk menggunakan semua fitur aplikasi',
                style: textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64),
              TextField(
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: textFieldDecoration(
                  context: context,
                  icon: const Icon(Icons.email_outlined),
                  hint: 'Email atau nomor telepon',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordTextController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: _hidePassword,
                decoration: textFieldDecoration(
                  context: context,
                  icon: const Icon(Icons.password),
                  hint: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    icon:
                        _hidePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  if (value.state == DataState.error) {
                    return Text(
                      value.error?.message ?? 'Terjadi kesalahan',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(color: Colors.red),
                    );
                  } else {
                    return SizedBox();
                  }
                },
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
                        onPressed: () => doLogin(),
                        child: Text(
                          'Login',
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
              Text('Tidak memiliki akun?'),
              InkWell(
                child: Text(
                  'Daftar sekarang',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
