import 'package:clean_architecture_model/home/domain/entity/employee_details_base.dart';

abstract class HomeRepositoryBase
{
  Future<List<EmployeeDetailsBase>> getEmployeeDetails();
}