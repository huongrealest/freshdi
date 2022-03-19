import 'package:flutter/material.dart';
import 'package:freshdi_test/core/theme/app_padding.dart';

class WidgetUtils {
  static const CircularProgressIndicator loadingCircle =
      CircularProgressIndicator();
  static const Padding sectionLoading = Padding(
    padding: AppPadding.a10,
    child: Center(
      child: loadingCircle,
    ),
  );
}

class SizedBoxExt {
  static const shrink = SizedBox.shrink();

  static const h5 = SizedBox(height: 5);
  static const w6 = SizedBox(width: 6);
  static const w3 = SizedBox(width: 3);

  static const h13 = SizedBox(height: 13);
  static const w13 = SizedBox(width: 13);
  static const h16 = SizedBox(height: 16);
  static const h22 = SizedBox(height: 22);
  static const h30 = SizedBox(height: 30);
}
