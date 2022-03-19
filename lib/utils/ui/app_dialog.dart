import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  static showLoadingCircle() => Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: const SizedBox.expand(
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ),
        barrierDismissible: false,
        routeSettings: const RouteSettings(name: 'loading'),
      );
  static Future<bool?> showToast(String msg) {
    Future.delayed(Duration(seconds: 2), () => Get.back(result: false));
    return Get.dialog(WillPopScope(
      onWillPop: () async {
        Get.back(result: true);
        return false;
      },
      child: IgnorePointer(
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Chip(
                label: Text(
                  msg,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.black.withOpacity(0.8),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    ));
  }
}
