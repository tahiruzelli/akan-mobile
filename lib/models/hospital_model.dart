class HospitalModel {
  int id;
  String contactNumber;
  String hospitalName;
  String location;
  String adress;
  int cityId;
  int districtId;
  String creationTime;

  HospitalModel(
      {this.id,
      this.contactNumber,
      this.hospitalName,
      this.location,
      this.adress,
      this.cityId,
      this.districtId,
      this.creationTime});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactNumber = json['contactNumber'];
    hospitalName = json['hospitalName'];
    location = json['location'];
    adress = json['adress'];
    cityId = json['cityId'];
    districtId = json['districtId'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['contactNumber'] = contactNumber;
    data['hospitalName'] = hospitalName;
    data['location'] = location;
    data['adress'] = adress;
    data['cityId'] = cityId;
    data['districtId'] = districtId;
    data['creationTime'] = creationTime;
    return data;
  }
}
