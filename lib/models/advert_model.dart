class AdvertModel {
  int id;
  String bloodType;
  int creatorID;
  int hospitalID;
  String details;
  int importancy;
  bool isCompleted;
  String completionTime;
  int donatorId;
  bool isActive;
  String creationTime;

  AdvertModel(
      {this.id,
      this.bloodType,
      this.creatorID,
      this.hospitalID,
      this.details,
      this.importancy,
      this.isCompleted,
      this.completionTime,
      this.donatorId,
      this.isActive,
      this.creationTime});

  AdvertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodType = json['bloodType'].toString();
    creatorID = json['creatorID'];
    hospitalID = json['hospitalID'];
    details = json['details'].toString();
    importancy = json['importancy'];
    isCompleted = json['isCompleted'];
    completionTime = json['completionTime'].toString();
    donatorId = json['donatorId'];
    isActive = json['isActive'];
    creationTime = json['creationTime'].toString().split('T')[0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['bloodType'] = bloodType;
    data['creatorID'] = creatorID;
    data['hospitalID'] = hospitalID;
    data['details'] = details;
    data['importancy'] = importancy;
    data['isCompleted'] = isCompleted;
    data['completionTime'] = completionTime;
    data['donatorId'] = donatorId;
    data['isActive'] = isActive;
    data['creationTime'] = creationTime;
    return data;
  }
}
