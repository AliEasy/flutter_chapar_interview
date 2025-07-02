import 'package:freezed_annotation/freezed_annotation.dart';

class BaseResponse {
  @JsonKey(name: 'message')
  final String? message;

  BaseResponse({this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(message: json["message"]);
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseSingleResponse<T> extends BaseResponse {
  T? data;

  BaseSingleResponse({super.message, this.data});

  factory BaseSingleResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) create,
  ) {
    return BaseSingleResponse<T>(
      message: json["message"],
      data: json['data'] != null ? create(json['data']) : null,
    );
  }
}
