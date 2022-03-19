import 'dart:convert' show JsonCodec;
import 'package:freshdi_test/core/constants/string_constants.dart';

import 'error.dart';

const _jsonCodec = JsonCodec();

class RequestResponse {
  final dynamic response;
  late final Map<String, dynamic> json;
  Error? error;

  Map<String, dynamic> get data {
    try {
      return json['message'];
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'message');
    }
  }

  String get message {
    try {
      return json['message'];
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'message');
    }
  }

  RequestResponse(this.response) {
    try {
      json = response is String
          ? _jsonCodec.decode((response as String).trim())
          : response is Map
              ? response
              : {};
      error = json['error'] == null ? null : Error.fromJson(json['error']);
    } catch (e) {
      error = Error(
        messages: e.toString(),
      );
    }
  }

  static Map<String, dynamic> parseResponseDataString(String str) =>
      RequestResponse(
        str,
      ).data;

  _buildJsonErrorMessage(Object e, String key) {
    if (error != null) return error!.messages;

    if (e.runtimeType.toString().contains('_TypeError')) print('''
${e.toString()}
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''');

    if (e is NoSuchMethodError) {
      print('''
NoSuchMethodError: The method '[]' was called on null
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''');

      return StringConst.errorHappenedTryAgain;
    }

    return e.toString();
  }
}
