import 'dart:io';
import 'package:clean_architecture_model/core/api/url.dart';
import 'package:dio/dio.dart';

import '../model/employee_details_model.dart';

class RemoteDatasource {
  RemoteDatasource._internal();

  static final RemoteDatasource _instance = RemoteDatasource._internal();

  static RemoteDatasource get instance => _instance;

  static const String employeeDetails = ApiUrl.employeeDetails;

  Future<List<EmployeeDetailsModel>> getEmployeeDetails() async {
    final Dio dio = Dio();
    Response response = await dio.get(employeeDetails);
    final int responseCode = response.statusCode ?? -1;
    if (responseCode == HttpStatus.ok) {
      final jsonResponse = response.data;

      if (jsonResponse['data'] != null) {
        final employeeDetails = List<EmployeeDetailsModel>.from(jsonResponse["data"].map((x) => EmployeeDetailsModel.fromJson(x)));

        return employeeDetails;
      } else {
        throw 'Get Employee Details API: No details found';
      }
    } else {
      throw 'Get Employee Details API: Invalid response';
    }
  }
}
