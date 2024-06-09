import 'package:dio/dio.dart';
import 'package:xtramile_movies/src/network/model/network_request_model.dart';

class PreparedNetworkRequest<Model> {
  const PreparedNetworkRequest(
    this.request,
    this.parser,
    this.dio,
    this.headers,
    this.onSendProgress,
    this.onReceiveProgress,
  );
  final NetworkRequest request;
  final Model Function(Object) parser;
  final Dio dio;
  final Map<String, dynamic> headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
}
