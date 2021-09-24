class BookResponses {
  Response? response;

  BookResponses({this.response});

  BookResponses.fromJson(Map<String, dynamic> json) {
    response =
    json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Errors {
  Errors({
    required this.error,
    required this.errorDescription,
  });

  final String error;
  final String errorDescription;

  factory Errors.fromJson(Map<String, dynamic> json) =>
      Errors(
        error: json["error"],
        errorDescription: json["error_description"],
      );

  Map<String, dynamic> toJson() =>
      {
        "error": error,
        "error_description": errorDescription,
      };
}

class Response {
  bool? status;
  String? message;
  late List<Datas> data;

  Response({required this.status, required this.message, required this.data});

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

class Datas {
  final String yearbook_name;
  final YearbookDescription yearbook_description;
  final String img_http_thumb;
  final String yearbook_banner;
  final String app_preview_description;
  final List<Pagesofyearbook> pages;

  Datas({required this.yearbook_name,
    required this.yearbook_description,
    required this.img_http_thumb,
    required this.yearbook_banner,
    required this.app_preview_description,
    required this.pages});

/* Datas.fromJson(Map<String, dynamic> json) {
        json["yearbook_name"] ?? "";
        json["yearbook_description"] != null
            ? YearbookDescription.fromJson(json["yearbook_description"])
            : YearbookDescription(Desc: "", Price: "");
        json["img_http_thumb"] ?? "";
        json["yearbook_banner"] ?? "";
        json["app_preview_description"] ?? "";
        if (json['pages'] != null) {
          pages = [];
          json['pages'].forEach((v) {
            pages.add(Pagesofyearbook.fromJson(v));
            print(Pagesofyearbook.fromJson(v));
          });
        }

  }*/

  factory Datas.fromJson(Map<String, dynamic> json) {
    return Datas(
      img_http_thumb: json["img_http_thumb"] ?? "",
      yearbook_banner: json["yearbook_banner"] ?? "",
      app_preview_description: json["app_preview_description"] ?? "",
      yearbook_name: json["yearbook_name"] ?? "",
      yearbook_description: json["yearbook_description"] != null
          ? YearbookDescription.fromJson(json["yearbook_description"])
          : YearbookDescription(Desc: "", Price: ""),
      pages: List<Pagesofyearbook>.from(
          json["pages"].map((x) => Pagesofyearbook.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['yearbook_name'] = this.yearbook_name;
    data['yearbook_description'] = this.yearbook_description;
    data['img_http_thumb'] = this.img_http_thumb;
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/*class Pagesofyearbook {
  int? master_yearbook_page_id;
  int? page_index;
  int? page_editable;
  int? master_template_id;
  int? width;
  int? height;
  String? page_name;
  late List<ImageData> image_data;

  Pagesofyearbook(
      {required this.master_yearbook_page_id,
      required this.page_index,
      required this.page_editable,
      required this.master_template_id,
      required this.width,
      required this.height,
      required this.page_name,
      required this.image_data});

  Pagesofyearbook.fromJson(Map<String, dynamic> json) {
    json["page_index"] ?? 0;
    json["page_editable"] ?? 0;
    json["master_yearbook_page_id"] ?? 0;
    json["master_template_id"] ?? 0;
    json["width"] ?? 0;
    json["height"] ?? 0;
    json["page_name"] ?? "";
    if (json['image_data'] != null) {
      image_data = [];
      json['image_data'].forEach((v) {
        image_data.add(ImageData.fromJson(v));
        print(ImageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['master_yearbook_page_id'] = this.master_yearbook_page_id;
    data['page_index'] = this.page_index;
    data['page_editable'] = this.page_editable;
    data['master_template_id'] = this.master_template_id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['page_name'] = this.page_name;
    if (this.image_data != null) {
      data['image_data'] = this.image_data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/
class Pagesofyearbook {
   int? master_yearbook_page_id;
   late int page_index;
   int? page_editable;
   int? master_template_id;
   int? width;
   int? height;
 late  String page_name;
  late List<ImageData> image_data;

  Pagesofyearbook({required this.master_yearbook_page_id,
    required this.page_index,
    required this.page_editable,
    required this.master_template_id,
    required this.width,
    required this.height,
    required this.page_name,
    required this.image_data});

  Pagesofyearbook.fromJson(Map<String, dynamic> json) {
    master_yearbook_page_id = json['master_yearbook_page_id'];
    page_index = json['page_index'];
    page_editable = json['page_editable'];
    master_template_id = json['master_template_id'];
    if (json['image_data'] != null) {
      image_data = <ImageData>[];
      json['image_data'].forEach((v) {
        image_data.add(new ImageData.fromJson(v));
      });
    }
    width = json['width'];
    height = json['height'];
    page_name = json['page_name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['master_yearbook_page_id'] = this.master_yearbook_page_id;
    data['page_index'] = this.page_index;
    data['page_editable'] = this.page_editable;
    data['master_template_id'] = this.master_template_id;
    if (this.image_data != null) {
      data['image_data'] = this.image_data.map((v) => v.toJson()).toList();
    }
    data['width'] = this.width;
    data['height'] = this.height;
    data['page_name'] = this.page_name;
    return data;
  }
/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['master_yearbook_page_id'] = this.master_yearbook_page_id;
    data['page_index'] = this.page_index;
    data['page_editable'] = this.page_editable;
    data['master_template_id'] = this.master_template_id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['page_name'] = this.page_name;
    if (this.image_data != null) {
      data['image_data'] = this.image_data.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}

class ImageData {
  final String page_id;
  final String thumb;
  final String large;

  ImageData({required this.page_id, required this.thumb, required this.large});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      page_id: json["page_id"] ?? "",
      thumb: json["thumb"] ?? "",
      large: json["large"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page_id'] = this.page_id;
    data['thumb'] = this.thumb;
    data['large'] = this.large;
    return data;
  }
}

class YearbookDescription {
  final String Desc;
  final String Price;

  YearbookDescription({required this.Desc, required this.Price});

  factory YearbookDescription.fromJson(Map<String, dynamic> json) =>
      YearbookDescription(
        Desc: json["Desc"] ?? "",
        Price: json["Price"] ?? "",
      );

  Map<String, dynamic> toJson() =>
      {
        "Desc": Desc,
        "Price": Price,
      };
}
