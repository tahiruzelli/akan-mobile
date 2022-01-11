class DistrictModel {
  int id;
  int cityId;
  String name;

  DistrictModel({this.id, this.cityId, this.name});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['cityId'] = cityId;
    data['name'] = name;
    return data;
  }
}
