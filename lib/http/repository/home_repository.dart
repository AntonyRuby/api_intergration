import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getCatFactData() async {
  var dio = Dio();
  try {
    Response response = await dio.get("https://cat-fact.herokuapp.com/facts");

    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> getUsersData() async {
  var dio = Dio();
  try {
    Response response = await dio.get("https://reqres.in/api/users?page=2");

    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> getWeatherData() async {
  var dio = Dio();

  try {
    Response response = await dio.get(
        'https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&output=json');

    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> usersPostData(String name, String job) async {
  var dio = Dio();

  try {
    Response response = await dio.post(
      'https://reqres.in/api/users',
      data: {"name": name, "job": job},
    );
    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}

Future<Map<String, dynamic>> getAllUser() async {
  var dio = Dio();

  try {
    Response response =
        await dio.get('https://practice-rest-api.herokuapp.com/api/v1/users');
    return {"success": true, "data": response.data};
  } on DioError catch (e) {
    return {"success": false, "data": e.toString()};
  }
}
