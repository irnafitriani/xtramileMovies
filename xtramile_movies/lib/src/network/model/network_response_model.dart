import 'package:freezed_annotation/freezed_annotation.dart';
part 'network_response_model.freezed.dart';

@freezed
class NetworkResponse<Model> with _$NetworkResponse {
  const factory NetworkResponse.ok(Model data) = Ok;
  const factory NetworkResponse.invalidParameters(String message) = InvalidParameters;

  /// 401
  const factory NetworkResponse.noAuth(String message) = NoAuth;

  /// 403
  const factory NetworkResponse.noAccess(String message) = NoAccess;

  /// 400
  const factory NetworkResponse.badRequest(String message) = BadRequest;

  /// 404
  const factory NetworkResponse.notFound(String message) = NotFound;

  /// 409
  const factory NetworkResponse.conflict(String message) = Conflict;

  /// 500
  const factory NetworkResponse.noData(String message) = NoData;
}
