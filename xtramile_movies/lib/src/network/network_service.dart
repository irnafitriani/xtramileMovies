import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';
import 'package:xtramile_movies/src/network/model/network_response_model.dart';
import 'package:xtramile_movies/src/network/model/prepared_request_model.dart';
import 'dart:convert';

abstract class NetworkService {
  /// generic type and parser are used to properly deserialise JSON
  Future<NetworkResponse<Model>> request<Model>(
    NetworkRequest request,
    Model Function(Object) parser, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  final Dio _dio;

  final _headers = {
    'Content-type': 'application/json',
    'Authorization': '',
  };

  NetworkServiceImpl(this._dio) {
    _dio.options.headers = _headers;

    _dio.interceptors.addAll({});
  }

  @override
  Future<NetworkResponse<Model>> request<Model>(
    NetworkRequest request,
    Model Function(Object) parser, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final req = PreparedNetworkRequest<Model>(
      request,
      parser,
      _dio,
      {..._headers, ...(request.headers ?? {})},
      onSendProgress,
      onReceiveProgress,
    );
    final result = await _executeRequest<Model>(req);
    return result;
  }

  Future<NetworkResponse<Model>> _executeRequest<Model>(
    PreparedNetworkRequest request,
  ) async {
    try {
      dynamic body = request.request.data.whenOrNull(
        json: (data) {
          return data;
        },
        text: (data) {
          return data;
        },
      );
      final CancelToken cancelToken = CancelToken();

      Response? response = await request.dio.request(
        request.request.path,
        data: body,
        queryParameters: request.request.queryParams,
        options: Options(
          method: request.request.type.name,
          headers: request.headers,
        ),
        onSendProgress: request.onSendProgress,
        onReceiveProgress: request.onReceiveProgress,
        cancelToken: cancelToken,
      );

      // Parse response body before returning
      final parsedBody = _parseResponseBody(response.data, request.parser);

      return NetworkResponse.ok(parsedBody);
    } on DioException catch (error) {
      final errorText = error.toString();
      if (error.requestOptions.cancelToken?.isCancelled ?? false) {
        return NetworkResponse.noData(errorText);
      }
      switch (error.response?.statusCode) {
        case 400:
          return NetworkResponse.badRequest(errorText);
        case 401:
          return NetworkResponse.noAuth(errorText);
        case 403:
          return NetworkResponse.noAccess(errorText);
        case 404:
          return NetworkResponse.notFound(errorText);
        case 409:
          return NetworkResponse.conflict(errorText);
        default:
          return NetworkResponse.noData(errorText);
      }
    } catch (error) {
      return NetworkResponse.noData(error.toString());
    }
  }

  dynamic _parseResponseBody(dynamic body, dynamic Function(Object) parser) {
    // Check if body needs parsing (e.g., it's JSON)
    if (body is String) {
      try {
        return parser(json.decode(body));
      } catch (e) {
        return null;
      }
    }
    // If not a String, return as is
    return body;
  }
}
