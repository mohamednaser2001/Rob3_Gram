class ResultModel {
  String? status;
  String? horizontalDiameter;

  ResultModel({this.status, this.horizontalDiameter});

  ResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    horizontalDiameter = json['Horizontal Diameter'];
  }

}