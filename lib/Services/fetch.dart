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

  Future beDonor(
      {@required String transmitterID, @required String advertId}) async {
    var response = await RestConnector(
      beDonorUrl + transmitterID + '/$advertId',
      requestType: "POST",
      data: '',
    ).getData();
    return response;
  }
}
