import 'package:flutter/material.dart';
import 'package:freshdi_test/core/theme/app_colors.dart';
import 'package:freshdi_test/utils/ui/widget_utils.dart';

class CustomModelBottomSheet extends StatelessWidget {
  const CustomModelBottomSheet({Key? key, required this.body})
      : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 68,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: AppColors.alto,
            ),
          ),
          SizedBoxExt.h16,
          body,
        ],
      ),
    );
  }
}
