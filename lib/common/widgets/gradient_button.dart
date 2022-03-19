import 'package:flutter/material.dart';
import 'package:freshdi_test/core/theme/app_border_and_radius.dart';
import 'package:freshdi_test/core/theme/app_text_styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      this.width,
      required this.text,
      this.onPressed,
      this.padding,
      this.icon})
      : super(key: key);

  final double? width;
  final String text;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: AppBorderAndRadius.formBorderRadius,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Color(0xFFFF872C),
            Color(0xFFFFB52C),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Text(
            text,
            style: AppTextStyles.button,
          ),
        ),
      ),
    );
    if (width != null) current = SizedBox(width: width, child: current);

    return current;
  }
}
