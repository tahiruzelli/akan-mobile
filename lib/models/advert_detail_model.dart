class AdvertDetailModel {
  Advert advert;
  List<AdvertPhotos> advertPhotos;
  List<AdvertCreator> advertCreator;
  List<AdvertHospital> advertHospital;

  AdvertDetailModel(
      {this.advert,
      this.advertPhotos,
      this.advertCreator,
      this.advertHospital});

  AdvertDetailModel.fromJson(Map<String, dynamic> json) {
    advert =
        json['advert'] != null ?  Advert.fromJson(json['advert']) : null;
    if (json['advertPhotos'] != null) {
      advertPhotos = <AdvertPhotos>[];
      json['advertPhotos'].forEach((v) {
        advertPhotos.add(AdvertPhotos.fromJson(v));
      });
    }
    if (json['advertCreator'] != null) {
      advertCreator = <AdvertCreator>[];
      json['advertCreator'].forEach((v) {
        advertCreator.add( AdvertCreator.fromJson(v));
      });
    }
    if (json['advertHospital'] != null) {
      advertHospital = <AdvertHospital>[];
      json['advertHospital'].forEach((v) {
        advertHospital.add( AdvertHospital.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (advert != null) {
      data['advert'] = advert.toJson();
    }
    if (advertPhotos != null) {
      data['advertPhotos'] = advertPhotos.map((v) => v.toJson()).toList();
    }
    if (advertCreator != null) {
      data['advertCreator'] =
          advertCreator.map((v) => v.toJson()).toList();
    }
    if (advertHospital != null) {
      data['advertHospital'] =
          advertHospital.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Advert {
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

  Advert(
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

  Advert.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bloodType = json['bloodType'];
    creatorID = json['creatorID'];
    hospitalID = json['hospitalID'];
    details = json['details'];
    importancy = json['importancy'];
    isCompleted = json['isCompleted'];
    completionTime = json['completionTime'].toString();
    donatorId = json['donatorId'] ?? 0;
    isActive = json['isActive'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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

class AdvertPhotos {
  int id;
  String url;
  int advertId;

  AdvertPhotos({this.id, this.url, this.advertId});

  AdvertPhotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    advertId = json['advertId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    data['advertId'] = advertId;
    return data;
  }
}

class AdvertCreator {
  int id;
  String email;
  String phone;
  String password;
  String fullName;
  String bloodType;
  String location;
  int cityId;
  int districtId;
  String maxDestination;
  bool isAvailable;
  String photoUrl;
  String creationTime;

  AdvertCreator(
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

  AdvertCreator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'].toString();
    phone = json['phone'].toString();
    password = json['password'].toString();
    fullName = json['fullName'].toString();
    bloodType = json['bloodType'].toString();
    location = json['location'].toString();
    cityId = json['cityId'];
    districtId = json['districtId'];
    maxDestination = json['maxDestination'].toString();
    isAvailable = json['isAvailable'];
    photoUrl = json['photoUrl'].toString();
    creationTime = json['creationTime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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

class AdvertHospital {
  int id;
  String contactNumber;
  String hospitalName;
  String location;
  String adress;
  int cityId;
  int districtId;
  String creationTime;

  AdvertHospital(
      {this.id,
      this.contactNumber,
      this.hospitalName,
      this.location,
      this.adress,
      this.cityId,
      this.districtId,
      this.creationTime});

  AdvertHospital.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
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