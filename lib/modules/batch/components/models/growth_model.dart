import 'package:freshdi_test/utils/helpers/time_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GrowthModel {
  final RxString growth;
  final RxString des;
  final Rx<DateTime?> date;
  final RxString quantity;
  final RxString unit;
  final RxString image;
  final RxString type;
  int verifiedImage;
  int createdTime;
  RxBool isExpanded = RxBool(false);

  GrowthModel({
    required String growth,
    required String des,
    DateTime? date,
    required this.createdTime,
    required String quantity,
    required String unit,
    required String image,
    required String type,
    required this.verifiedImage,
  })  : growth = RxString(growth),
        des = RxString(des),
        date = Rx(date),
        quantity = RxString(quantity),
        unit = RxString(unit),
        image = RxString(image),
        type = RxString(type);

  factory GrowthModel.fromJson(Map<String, dynamic> json) => GrowthModel(
        growth: json["cul_growth"],
        date: DateTime.parse(json["cul_growth_date"]),
        des: json["cul_growth_description"] ?? '',
        image: json["cul_growth_image"] ?? '',
        unit: json["cul_growth_uom"],
        type: json["cul_growth_type"],
        quantity: json["cul_growth_quantity"].toString(),
        verifiedImage: json["verified_img_time"],
        createdTime: json["cul_growth_img_created_time"],
      );

  Map<String, dynamic> toMap() => {
        'cul_growth': growth.value,
        'cul_growth_date': DateFormat('y-M-d').format(date.value!),
        'cul_growth_type': type.value,
        'cul_growth_quantity': quantity.value,
        'cul_growth_uom': unit.value,
        'cul_growth_image': image.value,
        'cul_growth_description': des.value,
        'verified_img_time': verifiedImage,
        'cul_growth_img_created_time': createdTime,
      };
}
