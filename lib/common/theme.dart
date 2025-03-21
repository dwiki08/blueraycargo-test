import 'package:flutter/material.dart';

const double defaultPadding = 16.0;

const defaultCircularRadius = Radius.circular(10);

const appBarColor = Color(0xECBBE5FF);
const navbarItemColor = Color(0xff42515a);
const navbarSelectedItemColor = Color(0xFF6394C4);
const primaryBlue = Color(0xFF007AFF);

ColorScheme colorScheme(BuildContext context) {
  return ColorScheme.fromSeed(seedColor: const Color(0xFF007AFF)).copyWith(
    primary: const Color(0xff42515a),
    onPrimary: const Color(0xff24323b),
    secondary: const Color(0x0f83939b),
  );
}

InputDecoration textFieldDecoration({
  required BuildContext context,
  required String hint,
  String? label,
  Widget? icon,
  String? error,
  Widget? suffixIcon,
}) => InputDecoration(
  icon: icon,
  labelText: label,
  hintText: hint,
  hintStyle: Theme.of(
    context,
  ).textTheme.labelLarge?.copyWith(color: Colors.grey),
  labelStyle: Theme.of(context).textTheme.labelLarge,
  alignLabelWithHint: true,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  errorText: error,
  suffixIcon: suffixIcon,
);

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Tutup',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

primaryButtonStyle({bool enabled = true}) => ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(defaultCircularRadius),
  ),
  minimumSize: const Size(100, 42),
  backgroundColor: enabled ? primaryBlue : Colors.grey,
);
