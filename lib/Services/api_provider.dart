import 'dart:convert';

import 'package:housy/Models/CompanyInfo/company_info.dart';
import 'package:housy/Utils/Constants.dart';
import 'package:http/http.dart';

class ApiProvider {
  Future getCompanyInfo(Map<String, String> companInfoHash) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    String jsonRequest = json.encode(companInfoHash);

    try {
      Response response = await post(
        Constants.companyUrl,
        headers: headers,
        body: jsonRequest,
      ).timeout(
        Duration(seconds: 12),
        onTimeout: () {
          // time has run out, do what you wanted to do
          print("timeout");
          throw "TimeOut";
        },
      );
      return CompanyInfoModel.fromJson(json.decode(response.body));
    } catch (_) {
      if (_.toString() == 'TimeOut') {
        return CompanyInfoModel();
      }
    }
  }
}
