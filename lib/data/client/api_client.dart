import 'dart:io';

import 'package:dio/dio.dart';

import 'dart:collection';

import 'package:freshdi_test/core/constants/api_path.dart';
import 'package:freshdi_test/core/constants/app_constants.dart';
import 'package:freshdi_test/core/error_handing/exceptions.dart';
import 'package:freshdi_test/data/models/request_method.dart';
import 'package:freshdi_test/data/models/request_response.dart';
import 'package:freshdi_test/data/services/connectivity_service.dart';
import 'package:sp_util/sp_util.dart';

const _exceptionCanResolveByReFecth = [
  'HttpException: Connection closed before full header was received',
  'HandshakeException: Connection terminated during handshake',
  'Connecting timed out',
  'Receiving data timeout',
];

final _baseOptions = BaseOptions(
  connectTimeout: 10000,
  receiveTimeout: 10000,
  baseUrl: ApiPath.baseUrl,
  responseType: ResponseType.json,
);

class ApiClient {
  late final Dio _dio;

  static ApiClient? _instance;

  factory ApiClient() => _instance ??= ApiClient._();

  ApiClient._() : _dio = Dio(_baseOptions)..interceptors;

  Future<RequestResponse> fetch(
    String url,
    RequestMethod method, {
    Map<String, dynamic>? data,
    Map<String, String>? searchParams,
    Map<String, dynamic>? headers,
    Options? options,
    String? token,
  }) async {
    print(url);
    print(data);

    headers ??= new HashMap();

    if (options == null)
      options = method.options;
    else
      options.method = method.name;

    if (SpUtil.getStringList('cookies')!.isNotEmpty) {
      headers.addAll({
        'Cookie':
            "full_name=Nguy%E1%BB%85n%20V%C4%83n%20A; sid=d30eb4e3cb200f872c8079027982b691b2a9ad308f0c6425476f3742; system_user=yes; user_id=test%40gmail.com; user_image="
      });
    }

    options.headers = headers;
    options.contentType ??= headers.containsKey('Authorization')
        ? ContentType(
            'application',
            'x-www-form-urlencoded',
            charset: "utf-8",
          ).mimeType
        : ContentType.json.mimeType;

    Response response;
    int retryTimes = 1;

    while (true) {
      try {
        response = await _dio.request(
          url,
          data: method == RequestMethod.post && data != null
              ? FormData.fromMap(data)
              : data,
          queryParameters: searchParams,
          options: options,
        );

        SpUtil.putStringList(
            'cookies', response.headers['Set-Cookie'] as List<String>);

        break;
      } on DioError catch (e) {
        if (_exceptionCanResolveByReFecth.any((el) => e.message.contains(el)) &&
            retryTimes <= AppConst.refecthApiThreshold) {
          retryTimes++;
          continue;
        }

        throw await _requestFailure(e, retryTimes);
      }
    }

    return RequestResponse(response.data);
  }

  Future<Response> fetchWithRequestOptions(RequestOptions options) =>
      _dio.request(
        options.path,
        data: options.data,
        options: Options(
          method: options.method,
          headers: options.headers,
        ),
      );

  Future<dynamic> _requestFailure(DioError e, int retryTimes) async {
    if (e.message.contains('Failed host lookup')) {
      if ((await ConnectivityService.canConnectToNetwork()) == false) {
        return NoConnectionException();
      } else {
        return InternalServerException();
      }
    }

    if (retryTimes == AppConst.refecthApiThreshold) {
      return PoorConnectionException();
    }

    return e;
  }
}
