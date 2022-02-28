import 'package:akan_mobile/Globals/constans/urls.dart';

class AllAdvertModel {
  int advertID;
  String advertBloodType;
  String advertCreationTime;
  String advertDetail;
  int advertCreatorId;
  String advertCreatorName;
  String advertCreatorPhoto;

  AllAdvertModel(
      {this.advertID,
      this.advertBloodType,
      this.advertCreationTime,
      this.advertDetail,
      this.advertCreatorId,
      this.advertCreatorName,
      this.advertCreatorPhoto});

  AllAdvertModel.fromJson(Map<String, dynamic> json) {
    advertID = json['advertID'];
    advertBloodType = json['advertBloodType'].toString();
    advertCreationTime = json['advertCreationTime'].toString().split('T')[0];
    advertDetail = json['advertDetail'];
    advertCreatorId = json['advertCreatorId'];
    advertCreatorName = json['advertCreatorName'];
    advertCreatorPhoto = json['advertCreatorPhoto'] == ''
        ? defaultPhotoUrl
        : json['advertCreatorPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['advertID'] = advertID;
    data['advertBloodType'] = advertBloodType;
    data['advertCreationTime'] = advertCreationTime;
    data['advertDetail'] = advertDetail;
    data['advertCreatorId'] = advertCreatorId;
    data['advertCreatorName'] = advertCreatorName;
    data['advertCreatorPhoto'] = advertCreatorPhoto;
    return data;
  }
}
