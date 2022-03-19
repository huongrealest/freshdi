import 'package:freshdi_test/core/constants/api_path.dart';
import 'package:freshdi_test/data/client/api_client.dart';
import 'package:freshdi_test/data/models/request_method.dart';
import 'package:freshdi_test/data/models/request_response.dart';

class CommonDataRepo {
  final ApiClient _client;

  CommonDataRepo() : _client = ApiClient();

  Future<List<String>> getListTask({required String itemGroup}) async {
    RequestResponse res = await _client.fetch(
      ApiPath.taskData,
      RequestMethod.post,
      data: {
        'item_group': itemGroup,
      },
    );

    return List<String>.from(res.response["message"].map((x) => x));
  }
}
