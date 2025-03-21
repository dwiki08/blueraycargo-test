import 'package:blueraycargo/common/constants.dart';
import 'package:blueraycargo/screen/register/register_profile_screen.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/theme.dart';

class RegisterPasswordScreen extends StatefulWidget {
  static const routeName = '/register-password';
  static const argsUserId = 'userId';

  const RegisterPasswordScreen({super.key});

  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  var _hidePassword = true;
  final _fieldTextController = TextEditingController();
  final _fieldTextNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _fieldTextController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _fieldTextController.removeListener(_onTextChanged);
    _fieldTextController.dispose();
    _fieldTextNotifier.dispose();
  }

  void _onTextChanged() {
    _fieldTextNotifier.value = _fieldTextController.text;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final userId = args[RegisterPasswordScreen.argsUserId];

    onSubmit() {
      Navigator.pushNamed(
        context,
        RegisterProfileScreen.routeName,
        arguments: {
          RegisterProfileScreen.argsUserId: userId,
          RegisterProfileScreen.argsPassword: _fieldTextController.text,
        },
      );
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
            spacing: 8,
            children: [
              SizedBox(height: 64),
              SvgPicture.asset(
                assetsIcons('ic_verified.svg'),
                height: 100,
                width: 100,
              ),
              SizedBox(height: 16),
              Text(
                'Verifikasi Kontak',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${userId.isValidEmail() ? 'Email' : 'Nomor telepon'} Anda sudah terverifikasi, silahkan membuat password sekarang',
                style: textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 64),
              TextField(
                controller: _fieldTextController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                obscureText: _hidePassword,
                decoration: textFieldDecoration(
                  context: context,
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
              ValueListenableBuilder<String>(
                valueListenable: _fieldTextNotifier,
                builder: (context, value, child) {
                  final isValidLength = value.length >= 8;
                  final isValidChars = RegExp(
                    r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*/]).+$",
                  ).hasMatch(value);
                  return Column(
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Icon(
                            Icons.add_box,
                            color: isValidLength ? primaryBlue : Colors.grey,
                          ),
                          Text('Minimal 8 karakter '),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Icon(
                            Icons.add_box,
                            color: isValidChars ? primaryBlue : Colors.grey,
                          ),
                          Flexible(
                            child: Text('Menggunakan huruf, angka, dan simbol'),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: primaryButtonStyle(
                            enabled: isValidLength && isValidChars,
                          ),
                          onPressed: () {
                            if (isValidLength && isValidChars) {
                              onSubmit();
                            }
                          },
                          child: Text(
                            'Selanjutnya',
                            style: textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
