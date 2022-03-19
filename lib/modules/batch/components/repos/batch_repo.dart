import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freshdi_test/core/constants/api_path.dart';
import 'package:freshdi_test/data/client/api_client.dart';
import 'package:freshdi_test/data/models/request_method.dart';
import 'package:freshdi_test/data/models/request_response.dart';
import 'package:freshdi_test/modules/batch/components/models/batch_model.dart';
import 'package:freshdi_test/modules/batch/components/models/growth_model.dart';

class BatchRepo {
  late final ApiClient _client;

  final String cultivation;

  late final DateTime createdTime;

  BatchRepo({this.cultivation = 'FTQWW001079733XJ'}) : _client = ApiClient();

  Future<BatchModel> getData() async {
    RequestResponse res = await _client.fetch(
      ApiPath.batchData,
      RequestMethod.post,
      data: {
        'cultivation': cultivation,
      },
    );
    return BatchModel.fromJson(res.data);
  }

  Future<String> uploadImage(File image) async {
    RequestResponse res = await _client.fetch(
        ApiPath.uploadImage, RequestMethod.post,
        data: {'file': await MultipartFile.fromFile(image.path)});
    createdTime = DateTime.parse(res.data['creation']);
    print(res.response);
    return res.data['file_url'];
  }

  Future<int> verifyImage(int imgTime) async {
    RequestResponse res =
        await _client.fetch(ApiPath.verifyImage, RequestMethod.post, data: {
      'img_time': imgTime,
      'created_time': createdTime.microsecondsSinceEpoch,
    });
    print(res.response);
    return res.data['verified_img_time'];
  }

  Future<bool> upsertGrowth(GrowthModel model) async {
    try {
      RequestResponse res = await _client.fetch(
          ApiPath.postGrowth, RequestMethod.post,
          data: {'cultivation': cultivation, ...model.toMap()});
      print(res.response);
      if (res.message == 'Thêm công việc thành công.') {
        return true;
      } else {
        throw res.message;
      }
    } catch (e) {
      rethrow;
    }
  }
}
