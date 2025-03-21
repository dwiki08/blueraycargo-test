import 'package:flutter/material.dart';

Widget divider({double margin = 8}) {
  return Container(
    height: 1,
    color: Colors.grey.shade200,
    margin: EdgeInsets.symmetric(horizontal: margin),
  );
}
