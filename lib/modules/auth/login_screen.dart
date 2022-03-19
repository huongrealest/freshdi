import 'package:flutter/material.dart';
import 'package:freshdi_test/common/widgets/custom_scaffold.dart';
import 'package:freshdi_test/common/widgets/outline_text_form_field.dart';
import 'package:freshdi_test/modules/auth/login_controller.dart';
import 'package:freshdi_test/routes/routes.dart';
import 'package:freshdi_test/utils/ui/widget_utils.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Đăng nhập',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            OutlineTextFormField(
              data: controller.model.email,
            ),
            SizedBoxExt.h22,
            OutlineTextFormField(
              data: controller.model.password,
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.upsertBatch),
              child: Text('Đăng nhập'),
            )
          ],
        ),
      ),
    );
  }
}
