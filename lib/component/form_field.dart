import 'package:flutter/material.dart';

import '../common/theme.dart';

Widget formField({
  required BuildContext context,
  required String label,
  TextEditingController? textController,
  String? hint,
  TextInputType? keyboardType = TextInputType.text,
  int? minLines = 1,
  int? maxLength,
  bool? enabled = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16),
      Text(label),
      SizedBox(height: 4),
      TextField(
        controller: textController,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        minLines: minLines,
        maxLines: minLines,
        decoration: textFieldDecoration(context: context, hint: hint ?? label),
        enabled: enabled,
      ),
    ],
  );
}
