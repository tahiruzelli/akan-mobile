import 'dart:convert';

import 'package:akan_mobile/Globals/constans/urls.dart';
import 'package:akan_mobile/Services/rest_connector.dart';
import 'package:flutter/material.dart';

class Fetch {
  Future login(String nickname, String password) async {
    Map body = {
      "email": nickname,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      loginUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future register({
    @required String email,
    @required String phone,
    @required String password,
    @required String fullName,
    @required String bloodType,
    @required String location,
    @required String cityId,
    @required String districtId,
    @required String photoUrl,
  }) async {
    Map body = {
      "email": email,
      "phone": phone,
      "password": password,
      "fullName": fullName,
      "bloodType": bloodType,
      "location": location,
      "cityId": cityId,
      "districtId": districtId,
      "photoUrl": photoUrl,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      registerUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future getUserById(id) async {
    var response = await RestConnector(
      getUserByIdUrl + id,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data'][0];
    } else {
      return null;
    }
  }

  Future getCities() async {
    var response = await RestConnector(
      getCitiesUrl,
      requestType: "GET",
      data: '',
    ).getData();
    return response['data']['cities'];
  }

  Future getDistricts(String id) async {
    var response = await RestConnector(
      getDistrictsUrl + '/$id',
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['districtsInCity'];
    } else {
      return [];
    }
  }

  Future getBloodTypes() async {
    var response = await RestConnector(
      getBloodTypesUrl,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['bloodTypes'];
    } else {
      return [];
    }
  }

  Future getHospitals() async {
    var response = await RestConnector(
      getHospitalsUrl,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['hospitals'];
    } else {
      return [];
    }
  }

  Future getAdverts() async {
    var response = await RestConnector(
      getAdvertsUrl,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data'];
    } else {
      return [];
    }
  }

  Future getMyProposals({@required String myID}) async {
    var response = await RestConnector(
      getMyProposalsUrl + myID,
      requestType: "GET",
      data: '',
    ).getData();
    return response['data'];
  }

  Future getAdvertProposals({@required String advertId}) async {
    var response = await RestConnector(
      getAdvertProposalsUrl + advertId,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data'];
    } else {
      return [];
    }
  }

  Future getMyAdverts({@required String myID}) async {
    var response = await RestConnector(
      getMyAdvertsUrl + myID,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['adverts'];
    } else {
      [];
    }
  }

  Future beDonor(
      {@required String transmitterID, @required String advertId}) async {
    var response = await RestConnector(
      beDonorUrl + transmitterID + '/$advertId',
      requestType: "POST",
      data: '',
    ).getData();
    return response;
  }

  Future postImage({
    @required String url,
    @required String advertId,
  }) async {
    Map body = {
      "url": url,
      "advertId": advertId,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      postImageUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future createAdvert({
    @required String bloodType,
    @required String creatorID,
    @required String hospitalID,
    @required String details,
  }) async {
    Map body = {
      "bloodType": bloodType,
      "creatorID": creatorID,
      "hospitalID": hospitalID,
      "details": details,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      getAdvertsUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future notificationSeen({@required String id}) async {
    var response = await RestConnector(
      notificationSeenUrl + id,
      requestType: "PUT",
      data: '',
    ).getData();
    return response;
  }

  Future getNotifications({@required String id}) async {
    var response = await RestConnector(
      getNotificationUrl,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['notifications'];
    } else {
      return [];
    }
  }

  Future getMyChatRooms({@required String id}) async {
    var response = await RestConnector(
      getMyChatRoomsUrl + id,
      requestType: "GET",
      data: '',
    ).getData();
    if (response['success']) {
      return response['data']['chatRoom'];
    } else {
      return [];
    }
  }

  Future createChatRoom(
      {@required String receiverId, @required String transmitterId}) async {
    Map body = {
      "receiverId": receiverId,
      "transmitterId": transmitterId,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      chatRoomsUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    if (response['success']) {
      return response['data']['chatroom'];
    } else {
      return [];
    }
  }

  Future getChatRoomWithUser(
      {@required String myId, @required String targetUserId}) async {
    var response = await RestConnector(
      getChatRoomWithUserUrl + myId + '/$targetUserId',
      requestType: "GET",
      data: '',
    ).getData();
    return response;
  }

  Future getAdvertDetail(id) async {
    var response = await RestConnector(
      getAdvertsUrl + '/$id',
      requestType: "GET",
      data: '',
    ).getData();
    return response['data'];
  }

  Future acceptProposal(id) async {
    var response = await RestConnector(
      acceptProposalUrl + id,
      requestType: "PUT",
      data: '',
    ).getData();
    return response;
  }

  Future changeProfilePhoto(
      {@required String userId, @required String photoUrl}) async {
    Map body = {
      "userId": userId,
      "newDataString": photoUrl,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      changeProfilePhotoUrl,
      requestType: "PUT",
      data: jsonBody,
    ).getData();
    return response;
  }
}
