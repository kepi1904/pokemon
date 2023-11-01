import 'dart:convert';

ResponseAPi responseAPIFromJson(String str) =>
    ResponseAPi.fromJson(json.decode(str));

String responseAPIToJson(ResponseAPi data) => json.encode(data.toJson());

class ResponseAPi {
  ResponseAPi({
    required this.data,
  });

  dynamic data;

  factory ResponseAPi.fromJson(Map<String, dynamic> json) =>
      ResponseAPi(data: json["results"]);

  Map<String, dynamic> toJson() => {"results": data};
}
