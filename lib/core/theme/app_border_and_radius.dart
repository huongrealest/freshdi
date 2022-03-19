import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBorderAndRadius {
  static const uniformBorder = Border.fromBorderSide(BorderSide(
    color: AppColors.border,
    width: 0.5,
  ));

  static const Radius formRadius = Radius.circular(5);

  static const Radius multilineFormRadius = Radius.circular(5);


  static const BorderRadius formBorderRadius = BorderRadius.all(formRadius);

  static const BorderRadius multilineFormBorderRadius =
      BorderRadius.all(multilineFormRadius);

  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border),
    borderRadius: formBorderRadius,
  );

  static const OutlineInputBorder outlineMultilineInputBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border),
    borderRadius: multilineFormBorderRadius,
  );

  static const OutlineInputBorder outlineInputDisabledBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border),
    borderRadius: formBorderRadius,
  );

  static const OutlineInputBorder outlineMultilineInputDisabledBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border),
    borderRadius: multilineFormBorderRadius,
  );

  static const OutlineInputBorder outlineInputFocusedBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.active),
    borderRadius: formBorderRadius,
  );

  static const OutlineInputBorder outlineMultilineInputFocusedBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.active),
    borderRadius: multilineFormBorderRadius,
  );

  static const OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: formBorderRadius,
  );

  static const OutlineInputBorder outlineMultilineInputErrorBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: multilineFormBorderRadius,
  );
}
