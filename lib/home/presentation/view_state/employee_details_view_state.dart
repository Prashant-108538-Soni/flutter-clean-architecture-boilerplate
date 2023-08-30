import 'package:clean_architecture_model/home/domain/entity/employee_details_base.dart';

class EmployeeDetailsViewState
{
EmployeeDetailsViewState({
  this.started = true,
  this.isBusy = false,
  this.isSuccess = false,
  this.employeeDetails = const [],

});
  final bool started;
  final bool isBusy;
  final bool isSuccess;
  final List<EmployeeDetailsBase> employeeDetails;
}