class ApiPath {
  /// Base URL
  static const String baseUrl = 'https://rpc.freshdi.com/api/method';

  static const String batchData =
      '/freshdi.data.test.batch_no.get_batch_no_detail';

  static const String login = '/freshdi.data.farm_company.login';
  static const String taskData =
      '/freshdi.data.test.batch_no_growth.get_list_task';
  static const String uploadImage = '/upload_file';
  static const String verifyImage =
      '/freshdi.data.test.batch_no_growth.verify_cultivation_growth';

  static const String postGrowth =
      '/freshdi.data.test.batch_no_growth.post_batch_no_growth';
}
