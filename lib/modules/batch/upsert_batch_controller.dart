import 'dart:io';

import 'package:freshdi_test/modules/batch/components/models/batch_model.dart';
import 'package:freshdi_test/modules/batch/components/models/growth_model.dart';
import 'package:freshdi_test/modules/batch/components/repos/batch_repo.dart';
import 'package:freshdi_test/utils/ui/app_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpsertBatchController extends SuperController<BatchModel> {
  UpsertBatchController(this._repo) {
    load();
  }
  final BatchRepo _repo;

  late BatchModel model;

  late GrowthModel growthModel;

  final ImagePicker _picker = ImagePicker();

  uploadImage() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      late final _imgTime = DateTime.now();
      try {
        AppDialogs.showLoadingCircle();
        growthModel.image.value = await _repo.uploadImage(File(image.path));
        growthModel.createdTime = _repo.createdTime.microsecondsSinceEpoch;
        growthModel.verifiedImage =
            await _repo.verifyImage(_imgTime.microsecondsSinceEpoch);
        Get.back();
      } catch (e) {
        Get.back();
        print(e);
      }
    }
    update();
  }

  addNewGrowth(String growth) {
    growthModel = GrowthModel(
      growth: growth,
      des: '',
      date: null,
      quantity: '',
      unit: '',
      image: '',
      type: '',
      verifiedImage: 0,
      createdTime: 0,
    );
  }

  load() async {
    change(null, status: RxStatus.loading());
    try {
      model = await _repo.getData();
      change(model, status: RxStatus.success());
    } catch (e) {
      print(e);
    }
  }

  upsertGrowth() async {
    AppDialogs.showLoadingCircle();
    try {
      if (await _repo.upsertGrowth(growthModel)) {
        AppDialogs.showToast('Thêm công việc thành công.');
        Get.back();
      }
    } catch (e) {
      Get.back();
      AppDialogs.showToast(e.toString());
    }
  }

  saveGrowth() {}

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
