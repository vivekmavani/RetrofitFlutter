

import 'package:json_annotation/json_annotation.dart';
//part 'year_book_description.g.dart';
@JsonSerializable()
class YearbookDescription{
 final String Desc;
 final String Price;

 YearbookDescription({required this.Desc, required this.Price});

 factory YearbookDescription.fromJson(Map<String, dynamic> json) =>
     YearbookDescription(
      Desc: json["Desc"] ?? "",
      Price: json["Price"]?? "",
     );
 Map<String, dynamic> toJson() => {
  "Desc": Desc,
  "Price": Price,
 };


}
