import 'dart:convert';
import 'package:akan_mobile/Globals/constans/urls.dart';
import 'package:http/http.dart' as http;

class RestConnector {
  String url;
  String requestType;
  String data;
  String dataType;
  bool cacheRefresh;
  RestConnector(
    this.url, {
    this.requestType = "GET",
    this.data = "",
    this.dataType = "json",
    this.cacheRefresh = false,
  });

  getData() async {
    var response;
    if (requestType == 'GET') {
      response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          'content-type': 'application/json',
        },
      );
    } else if (requestType == 'POST') {
      response = await http.post(
        Uri.parse(baseUrl + url),
        body: data,
        headers: {
          'content-type': 'application/json',
        },
      );
    } else if (requestType == "PUT") {
      response = await http.put(
        Uri.parse(baseUrl + url),
        body: data,
        headers: {
          'content-type': 'application/json',
        },
      );
    }
    var parsedResponse = json.decode(response.body);

    return parsedResponse;
  }
}
