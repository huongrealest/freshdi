import 'package:flutter/material.dart';
import 'package:freshdi_test/core/constants/app_constants.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle appbarTitle = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 21.09 / 18,
  );
  static const TextStyle title = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: AppColors.gray,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 23.44 / 20,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: AppColors.border,
    fontSize: 11,
    height: 18 / 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle input = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: AppColors.text,
    fontSize: 11,
    height: 18 / 11,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle formFieldLabel = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: AppColors.text,
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppConst.fontRoboto,
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
