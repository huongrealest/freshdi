import 'package:freshdi_test/modules/batch/components/models/growth_model.dart';
import 'package:freshdi_test/utils/helpers/time_utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BatchModel {
  final String name;
  final RxString batchName;
  final RxString type;
  final RxString location;
  final RxString standard;
  final RxString quantity;
  final RxString unit;
  final Rx<DateTime> start;
  final Rx<DateTime> end;
  final String itemGroup;
  final List<GrowthModel> growths;

  

  BatchModel({
    required this.name,
    required this.itemGroup,
    required this.growths,
    required String batchName,
    required String type,
    required String location,
    required String standard,
    required String quantity,
    required String unit,
    required DateTime start,
    required DateTime end,
  })  : batchName = RxString(batchName),
        type = RxString(type),
        location = RxString(location),
        quantity = RxString(quantity),
        start = Rx(start),
        end = Rx(end),
        standard = RxString(standard),
        unit = RxString(unit);

  String get stringHarvestTime =>
      TimeUtils.apiDateFormatToDefaultDateFormat(start.value) +
      TimeUtils.apiDateFormatToDefaultDateFormat(end.value);

  factory BatchModel.fromJson(Map<String, dynamic> json) => BatchModel(
        batchName: json['cul_batch_no'],
        type: json['cul_seed'] ?? '',
        location: json['cul_subfarm'] ?? '',
        standard: json['cul_cert'],
        quantity: json['cul_harvest_size'].toString(),
        unit: json['cul_harvest_uom'],
        start: DateTime.parse(json['cul_harvest_start_date']),
        end: DateTime.parse(
          json['cul_harvest_end_date'],
        ),
        name: json['cul_item_name'] ?? '',
        itemGroup: json['farm_item_group'],
        growths: List<GrowthModel>.from(
            json["cul_growth"].map((x) => GrowthModel.fromJson(x))),
      );
}
