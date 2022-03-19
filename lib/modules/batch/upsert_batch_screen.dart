import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_field/date_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:freshdi_test/common/repos/common_data_repo.dart';
import 'package:freshdi_test/common/widgets/custom_model_bottom_sheet.dart';
import 'package:freshdi_test/common/widgets/custom_scaffold.dart';
import 'package:freshdi_test/common/widgets/gradient_button.dart';
import 'package:freshdi_test/common/widgets/outline_text_form_field.dart';
import 'package:freshdi_test/common/widgets/text_field_label.dart';
import 'package:freshdi_test/core/constants/string_constants.dart';
import 'package:freshdi_test/core/theme/app_border_and_radius.dart';
import 'package:freshdi_test/core/theme/app_colors.dart';
import 'package:freshdi_test/core/theme/app_form_field.dart';
import 'package:freshdi_test/core/theme/app_text_styles.dart';
import 'package:freshdi_test/modules/batch/upsert_batch_controller.dart';
import 'package:freshdi_test/utils/data/unit.dart';
import 'package:freshdi_test/utils/helpers/time_utils.dart';
import 'package:freshdi_test/utils/ui/widget_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UpsertBatchScreen extends GetView<UpsertBatchController> {
  const UpsertBatchScreen({Key? key}) : super(key: key);

  static const TextStyle _data = TextStyle(
    color: Color(0xFF828282),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: StringConst.productionBatch,
      body: controller.obx((state) => Padding(
            padding: const EdgeInsets.only(
              top: 26,
              left: 28,
              right: 31,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state!.name,
                  style:
                      AppTextStyles.appbarTitle.copyWith(color: AppColors.text),
                ),
                SizedBoxExt.h22,
                _rowInput(
                  StringConst.productionBatch,
                  OutlineTextFormField(
                    data: controller.model.batchName,
                  ),
                ),
                SizedBoxExt.h5,
                _rowInput(
                  StringConst.breedType,
                  OutlineTextFormField(
                    data: controller.model.type,
                  ),
                ),
                SizedBoxExt.h5,
                _rowInput(
                  StringConst.productLocation,
                  OutlineTextFormField(
                    data: controller.model.location,
                  ),
                ),
                SizedBoxExt.h5,
                _rowInput(
                  StringConst.standard,
                  OutlineTextFormField(
                    data: controller.model.standard,
                  ),
                ),
                SizedBoxExt.h5,
                _rowInput(
                  StringConst.expectedUutput,
                  Row(
                    children: [
                      Expanded(
                        child: OutlineTextFormField(
                          data: controller.model.quantity,
                        ),
                      ),
                      SizedBoxExt.w6,
                      Expanded(
                        child: OutlineTextFormField(
                          data: controller.model.unit,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxExt.h5,
                _rowInput(
                  StringConst.harvestTime,
                  Row(
                    children: [
                      Expanded(
                        child: DateTimeFormField(
                          dateFormat: DateFormat('dd/MM/yy'),
                          dateTextStyle: AppTextStyles.input,
                          initialValue: controller.model.start.value,
                          onDateSelected: (value) => {},
                          decoration: AppFormField.inputDecoration,
                        ),
                      ),
                      SizedBoxExt.w6,
                      Expanded(
                        child: DateTimeFormField(
                          dateFormat: DateFormat('dd/MM/yy'),
                          dateTextStyle: AppTextStyles.input,
                          initialValue: controller.model.end.value,
                          onDateSelected: (value) => {},
                          decoration: AppFormField.inputDecoration,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxExt.h30,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringConst.productJourney,
                    style: AppTextStyles.title,
                  ),
                ),
                SizedBoxExt.h22,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConst.produce,
                      style: AppTextStyles.appbarTitle
                          .copyWith(color: AppColors.text),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
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
                          onTap: () {
                            _showMbsSelectTask(context,
                                itemGroup: controller.model.itemGroup);
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 17,
                              ),
                              SizedBoxExt.w3,
                              Text(
                                StringConst.addWork,
                                style:
                                    AppTextStyles.button.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () =>
                        controller.model.growths[index].isExpanded.value =
                            !controller.model.growths[index].isExpanded.value,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      color: const Color(0xFFF2994A).withOpacity(0.3),
                      dashPattern: const [6, 3, 0, 1],
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                controller.model.growths[index].growth.value,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.gray,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                TimeUtils.apiDateFormatToDefaultDateFormat(
                                    controller
                                        .model.growths[index].date.value!),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF828282),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_horiz),
                                onPressed: () {},
                              ),
                            ),
                            Obx(() => controller
                                    .model.growths[index].isExpanded.value
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Column(
                                      children: [
                                        if (controller.model.growths[index].type
                                                .value !=
                                            '')
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12),
                                            child: Row(
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    'Loại sản phẩm',
                                                    style: _data,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .model
                                                        .growths[index]
                                                        .type
                                                        .value,
                                                    style: _data,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        if (controller.model.growths[index]
                                                .quantity.value !=
                                            '')
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12),
                                            child: Row(
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    'Khối lượng',
                                                    style: _data,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                            .model
                                                            .growths[index]
                                                            .quantity
                                                            .value +
                                                        " " +
                                                        controller
                                                            .model
                                                            .growths[index]
                                                            .unit
                                                            .value,
                                                    style: _data,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        if (controller.model.growths[index].des
                                                .value !=
                                            '')
                                          Text(
                                            controller
                                                .model.growths[index].des.value,
                                            style: _data,
                                          ),
                                        if (controller.model.growths[index]
                                                .image.value !=
                                            '')
                                          Image.network(
                                              'https://rpc.freshdi.com/files/' +
                                                  controller
                                                      .model
                                                      .growths[index]
                                                      .image
                                                      .value)
                                      ],
                                    ),
                                  )
                                : SizedBoxExt.shrink)
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBoxExt.h13,
                  itemCount: controller.model.growths.length,
                ),
              ],
            ),
          )),
    );
  }

  static Row _rowInput(String label, Widget input) => Row(
        children: [
          Expanded(
            flex: 4,
            child: TextfieldLabel(
              label,
            ),
          ),
          Expanded(
            flex: 6,
            child: input,
          ),
        ],
      );

  _showMbsSelectTask(BuildContext context, {required String itemGroup}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) =>
          GetBuilder<UpsertBatchController>(builder: (context) {
        return CustomModelBottomSheet(
            body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Chọn loại công việc",
              style: AppTextStyles.title,
            ),
            FutureBuilder(
              future: Future.value(
                  CommonDataRepo().getListTask(itemGroup: itemGroup)),
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WidgetUtils.sectionLoading;
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        controller.addNewGrowth(snapshot.data![index]);
                        Get.back();
                        _showMbsUpsertGrow(context);
                      },
                      title: Text(
                        snapshot.data![index],
                        style: AppTextStyles.appbarTitle.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.alto,
                      thickness: 1,
                      height: 0,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return SizedBoxExt.shrink;
              },
            ),
          ],
        ));
      }),
    );
  }

  _showMbsUpsertGrow(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        builder: (context) => GetBuilder<UpsertBatchController>(
              builder: (controller) {
                RxBool _expanded = RxBool(false);
                return CustomModelBottomSheet(
                  body: Padding(
                    padding: MediaQuery.of(context)
                        .viewInsets
                        .copyWith(left: 24, right: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBoxExt.h22,
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  controller.growthModel.growth.value,
                                  style: AppTextStyles.title,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: DateTimeFormField(
                                  dateFormat: DateFormat('dd/MM/yy'),
                                  dateTextStyle: AppTextStyles.input,
                                  initialValue:
                                      controller.growthModel.date.value,
                                  onDateSelected: (value) =>
                                      controller.growthModel.date.value = value,
                                  decoration: AppFormField.inputDecoration
                                      .copyWith(hintText: 'Chọn ngày'),
                                ),
                              ),
                            ],
                          ),
                          SizedBoxExt.h30,
                          OutlineTextFormField(
                            data: controller.growthModel.des,
                            multiline: true,
                            decoration:
                                AppFormField.nonboderInputDecoration.copyWith(
                                    hintStyle: AppTextStyles.hintText.copyWith(
                              fontSize: 16,
                            )),
                            hintText: 'Mô tả công việc',
                          ),
                          const Divider(
                            color: AppColors.alto,
                            thickness: 1,
                            height: 0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.growthModel.image.value != ''
                              ? Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: 'https://rpc.freshdi.com' +
                                          controller.growthModel.image.value,
                                      height: 165,
                                      width: 173,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                    if (controller.growthModel.verifiedImage ==
                                        1)
                                      const Icon(
                                        Icons.check_circle_outline,
                                        color: Color(0xFF008934),
                                      ),
                                  ],
                                )
                              : ListTile(
                                  onTap: () => controller.uploadImage(),
                                  leading: const Icon(
                                    Icons.image_outlined,
                                    color: Color(0xFF219653),
                                  ),
                                  minLeadingWidth: 0,
                                  title: Text(
                                    'Thêm ảnh',
                                    style: AppTextStyles.button
                                        .copyWith(color: AppColors.gray),
                                  ),
                                ),
                          Obx(
                            () => ExpansionPanelList(
                              animationDuration:
                                  const Duration(milliseconds: 200),
                              elevation: 0,
                              expansionCallback: (panelIndex, isExpanded) {
                                _expanded.value = !_expanded.value;
                              },
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      leading: const Icon(
                                        Icons.error,
                                        color: Color(0xFF2F80ED),
                                      ),
                                      minLeadingWidth: 0,
                                      title: Text(
                                        'Thêm chi tiết',
                                        style: AppTextStyles.button
                                            .copyWith(color: AppColors.gray),
                                      ),
                                    );
                                  },
                                  isExpanded: _expanded.value,
                                  body: Column(
                                    children: [
                                      OutlineTextFormField(
                                        data: controller.growthModel.type,
                                        decoration: const InputDecoration(
                                            isDense: false,
                                            hintText: 'Loại sản phẩm'),
                                      ),
                                      SizedBoxExt.h13,
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: OutlineTextFormField(
                                              data: controller
                                                  .growthModel.quantity,
                                              decoration: const InputDecoration(
                                                  isDense: false,
                                                  hintText: 'Khối lượng'),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                          SizedBoxExt.w13,
                                          Expanded(
                                            flex: 4,
                                            child:
                                                DropdownButtonFormField<String>(
                                              onChanged: (value) {
                                                controller.growthModel.unit
                                                    .value = value!;
                                              },
                                              items: Unit.value
                                                  .map(
                                                    (e) => DropdownMenuItem<
                                                        String>(
                                                      child: Text(e),
                                                      value: e,
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  canTapOnHeader: true,
                                ),
                              ],
                              dividerColor: Colors.grey,
                            ),
                          ),
                          SizedBoxExt.h22,
                          GradientButton(
                            text: 'Lưu',
                            width: double.infinity,
                            onPressed: () => controller.upsertGrowth(),
                          ),
                          SizedBoxExt.h22,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}
