
import 'package:taskretofitpicsy/network/model/datas.dart';

/*
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
    status: json["status"] ?? "" ,
    message: json["message"] ?? "",
    data: List<Datas>.from(json["data"].map((x) => Datas.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

}
*/

class BookResponses {
  Response? response;

  BookResponses({this.response});

  BookResponses.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}
class Response {
  bool? status;
  String ? message;
  late List<Datas> data;

  Response({this.status, this.message, required this.data});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Datas.fromJson(v));
        print(Datas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
