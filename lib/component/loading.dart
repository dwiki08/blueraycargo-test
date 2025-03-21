import 'package:flutter/material.dart';

import '../common/theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.marginTop});

  final double? marginTop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: marginTop),
          const CircularProgressIndicator(),
          const SizedBox(height: defaultPadding),
          Text('Loading....'),
        ],
      ),
    );
  }
}
