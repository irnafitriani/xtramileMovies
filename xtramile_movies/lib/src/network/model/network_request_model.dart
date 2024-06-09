import 'package:xtramile_movies/src/network/model/request_body_model.dart';

enum NetworkRequestType { get, post, put, patch, delete }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    this.data = const NetworkRequestBody.empty(),
    this.queryParams,
    this.headers,
  });

  final NetworkRequestType type;
  final String path;
  final NetworkRequestBody data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
}
