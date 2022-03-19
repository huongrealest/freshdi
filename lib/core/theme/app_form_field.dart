import 'package:flutter/material.dart';

import 'app_border_and_radius.dart';
import 'app_padding.dart';
import 'app_text_styles.dart';

class AppFormField {
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    hintStyle: AppTextStyles.hintText,
    errorMaxLines: 2,
    contentPadding: AppPadding.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineInputBorder,
    disabledBorder: AppBorderAndRadius.outlineInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
  );

  static const InputDecoration inputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    helperMaxLines: 2,
    contentPadding: AppPadding.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineInputBorder,
    disabledBorder: AppBorderAndRadius.outlineInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
    isDense: true,
  );

  static const InputDecoration nonboderInputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    helperMaxLines: 2,
    contentPadding: AppPadding.formFieldContent,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
    isDense: true,
  );

  static const InputDecoration multilineInputDecoration = InputDecoration(
    hintStyle: AppTextStyles.hintText,
    hintMaxLines: 2,
    errorMaxLines: 2,
    contentPadding: AppPadding.formFieldContent,
    enabledBorder: AppBorderAndRadius.outlineMultilineInputBorder,
    disabledBorder: AppBorderAndRadius.outlineMultilineInputDisabledBorder,
    focusedBorder: AppBorderAndRadius.outlineMultilineInputFocusedBorder,
    errorBorder: AppBorderAndRadius.outlineMultilineInputErrorBorder,
    focusedErrorBorder: AppBorderAndRadius.outlineMultilineInputErrorBorder,
    filled: true,
    fillColor: Colors.white,
  );
}
