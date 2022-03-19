import 'package:flutter/material.dart';
import 'package:freshdi_test/core/constants/asset_path.dart';
import 'package:freshdi_test/core/theme/app_text_styles.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {Key? key,
      this.automaticallyHandleBackButtonPress = false,
      required this.title,
      this.showBackBtn = true,
      required this.body,
      this.actions,
      this.onBackBtnPressed})
      : super(key: key);

  /// if you provide [onBackBtnPressed],
  /// so [automaticallyHandleBackButtonPress] must be false
  final bool automaticallyHandleBackButtonPress;
  final String title;
  final bool showBackBtn;
  final Widget body;
  final List<Widget>? actions;
  final void Function()? onBackBtnPressed;

  @override
  Widget build(BuildContext context) {
    navigateBack() => Navigator.pop(context);
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: height,
        leading: showBackBtn == false
            ? null
            : IconButton(
                onPressed: onBackBtnPressed ?? navigateBack,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
        centerTitle: true,
        flexibleSpace: Image.asset(
          AssetPath.appBarBackground,
          height: 95,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: AppTextStyles.appbarTitle,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
        actions: actions,
      ),
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
