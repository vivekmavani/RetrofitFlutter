



import 'package:json_annotation/json_annotation.dart';
import 'package:taskretofitpicsy/network/model/datas.dart';
part 'responses.g.dart';
@JsonSerializable()
class Responses {
  final bool status;
  final String message;
  final List<Datas> data;

  Responses({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Responses.fromJson(Map<String, dynamic> json) => Responses(
    status: json["status"],
    message: json["message"],
    data: List<Datas>.from(json["data"].map((x) => Datas.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

}
