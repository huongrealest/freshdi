import 'package:freshdi_test/modules/batch/components/repos/batch_repo.dart';
import 'package:freshdi_test/modules/batch/upsert_batch_controller.dart';
import 'package:get/get.dart';

class UpsertBatchBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BatchRepo>(() => BatchRepo());
    Get.lazyPut(() => UpsertBatchController(Get.find<BatchRepo>()));
  }
}
