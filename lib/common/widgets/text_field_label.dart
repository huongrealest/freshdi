import 'package:flutter/material.dart';
import 'package:freshdi_test/core/theme/app_text_styles.dart';

class TextfieldLabel extends StatelessWidget {
  const TextfieldLabel(
    this.data, {
    Key? key,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data, style: AppTextStyles.formFieldLabel);
  }
}
