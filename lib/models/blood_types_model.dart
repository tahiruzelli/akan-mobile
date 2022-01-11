class BloodTypesModel {
  int id;
  String type;

  BloodTypesModel({this.id, this.type});

  BloodTypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
