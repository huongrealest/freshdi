import 'package:freshdi_test/core/constants/app_constants.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  static final dateFormat = DateFormat(AppConst.datePattern);
  static final apiDateFormat = DateFormat(AppConst.apiDatePattern);

  static String apiDateFormatToDefaultDateFormat(DateTime dateTime) =>
      dateFormat.format(dateTime);
}
