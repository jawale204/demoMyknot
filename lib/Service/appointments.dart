import 'dart:convert';

import 'package:dio/dio.dart';

class HandleAppointments {
  getAllAppointents() async {
    Dio dio = new Dio();
    var params = {
      "notary": "60280100a063a42fb456c252",
      "today12am": "2021-03-01 00:00:00 GMT+0530",
      "order": "603768d4c54c430015c9bdb7"
    };
    try {
      Response res = await dio.post(
          'https://my-notary-app.herokuapp.com/getNotaryHomepage',
          options: Options(contentType: 'application/json'),
          data: jsonEncode(params));
      print(res.data);
      return res.data;
    } catch (e) {
      print(e);
    }
  }

  getSingleAppointents(id) async {
    Dio dio = new Dio();
    var params = {
      "notary": "60280100a063a42fb456c252",
      "today12am": "2021-03-01 00:00:00 GMT+0530",
      "order": id
    };
    try {
      Response res = await dio.post(
          'https://my-notary-app.herokuapp.com/getOrderDetails',
          options: Options(contentType: 'application/json'),
          data: jsonEncode(params));
      print(res.data);
      return res.data;
    } catch (e) {
      print(e);
    }
  }
}
