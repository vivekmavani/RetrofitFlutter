
import 'package:taskretofitpicsy/network/model/year_book_description.dart';
//part 'datas.g.dart';
 //@JsonSerializable()
class Datas{
  final String yearbook_name;
  final YearbookDescription yearbook_description;
  final String img_http_thumb;

  Datas({required this.yearbook_name, required this.yearbook_description, required this.img_http_thumb});

  factory Datas.fromJson(Map<String, dynamic> json){
    if (json.isNotEmpty){
      return  Datas(
        yearbook_name: json["yearbook_name"] ?? "",
        yearbook_description: json["yearbook_description"]!=null?YearbookDescription.fromJson(json["yearbook_description"]):YearbookDescription(Desc: "",Price: ""),
        img_http_thumb: json["img_http_thumb"]?? "",
      );
    }else{
      return Datas(yearbook_name: "", yearbook_description: YearbookDescription(Desc: "",Price: ""), img_http_thumb: "");
    }
  }

  Map<String, dynamic> toJson() => {
    "yearbook_name": yearbook_name,
    "yearbook_description": yearbook_description == null ? null : yearbook_description.toJson(),
    "img_http_thumb": img_http_thumb,
  };

}