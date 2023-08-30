import 'dart:developer';

import 'package:clean_architecture_model/home/domain/entity/employee_details_base.dart';
import 'package:clean_architecture_model/home/domain/usecase/employee_details_usecase.dart';
import 'package:clean_architecture_model/home/presentation/view_state/employee_details_view_state.dart';
import 'package:flutter/cupertino.dart';

class EmployeeDetailsController extends ChangeNotifier {
  EmployeeDetailsController({required this.employeeDetailsUsecase}) {
    init();
  }
  final ValueNotifier<EmployeeDetailsViewState> employeeDetailsViewState = ValueNotifier(EmployeeDetailsViewState(started: false));
  final EmployeeDetailsUsecase employeeDetailsUsecase;

  Future<void> init() async {
    await fetchEmployeeDetails();
  }

  Future<void> onRefresh() async {
    await fetchEmployeeDetails();
  }

  Future<void> fetchEmployeeDetails() async {
    try {
      if (employeeDetailsViewState.value.isBusy) {
        log('fetchEmployeeDetails: Already fetching details of Employee');
        return;
      }
      employeeDetailsViewState.value = EmployeeDetailsViewState(
        isBusy: true,
      );
      final List<EmployeeDetailsBase> employeeDetails = await employeeDetailsUsecase();
      employeeDetailsViewState.value = EmployeeDetailsViewState(isSuccess: true, employeeDetails: employeeDetails);
    } catch (e) {
      log('Exception accur in fetchEmployeeDetails');
      employeeDetailsViewState.value = EmployeeDetailsViewState(started: false);
    }
  }
}
