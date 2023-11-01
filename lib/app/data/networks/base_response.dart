class BaseResponseApi {
  BaseResponseApi({this.status, this.message, required this.data});

  factory BaseResponseApi.fromJson(Map<String, dynamic> json) =>
      BaseResponseApi(
        data: json['results'] as List<dynamic>?,
      );

  dynamic status;
  String? message;

  List<dynamic>? data;

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}
