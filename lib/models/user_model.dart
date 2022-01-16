import 'package:akan_mobile/Globals/constans/urls.dart';

class UserModel {
  int id;
  String email;
  String phone;
  String password;
  String fullName;
  String bloodType;
  String location;
  int cityId;
  int districtId;
  int maxDestination;
  bool isAvailable;
  String photoUrl;
  String creationTime;

  UserModel(
      {this.id,
      this.email,
      this.phone,
      this.password,
      this.fullName,
      this.bloodType,
      this.location,
      this.cityId,
      this.districtId,
      this.maxDestination,
      this.isAvailable,
      this.photoUrl,
      this.creationTime});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    fullName = json['fullName'];
    bloodType = json['bloodType'];
    location = json['location'];
    cityId = json['cityId'];
    districtId = json['districtId'];
    maxDestination = json['maxDestination'];
    isAvailable = json['isAvailable'];
    photoUrl = json['photoUrl'] ==''?defaultPhotoUrl: json['photoUrl'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['fullName'] = fullName;
    data['bloodType'] = bloodType;
    data['location'] = location;
    data['cityId'] = cityId;
    data['districtId'] = districtId;
    data['maxDestination'] = maxDestination;
    data['isAvailable'] = isAvailable;
    data['photoUrl'] = photoUrl;
    data['creationTime'] = creationTime;
    return data;
  }
}
