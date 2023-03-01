class ValidationModel {
  List<Detail>? detail;

  ValidationModel({this.detail});

  ValidationModel.fromJson(Map<String, dynamic> json) {
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
  }

}

class Detail {
  List<String>? loc;
  String? msg;
  String? type;

  Detail({this.loc, this.msg, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    loc = json['loc'].cast<String>();
    msg = json['msg'];
    type = json['type'];
  }


}