import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url,  String ? token }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url) ,headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body).toString()) ;
      return jsonDecode(response.body);
    } else {
      print ('error ');
      throw Exception('error status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if(response.statusCode == 200 ) {
      Map<String,dynamic >  data = jsonDecode(
        response.body
      );
    }else{
      throw Exception( 'error post request ${response.statusCode} and body ${jsonDecode(response.body)}  ' );
    }
  }

  Future<dynamic> put(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
    await http.post(Uri.parse(url), body: body, headers: headers);
    if(response.statusCode == 200 ) {
      Map<String,dynamic >  data = jsonDecode(
          response.body
      );
    }else{
      throw Exception(
          'error post request ${response.statusCode} and body ${jsonDecode(response.body)}  '
      );
    }
  }
}
