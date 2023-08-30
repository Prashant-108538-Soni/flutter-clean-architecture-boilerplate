import 'package:clean_architecture_model/home/domain/entity/employee_details_base.dart';
import 'package:clean_architecture_model/home/domain/repo/repo.dart';

class EmployeeDetailsUsecase
{
  EmployeeDetailsUsecase(this.homeRepositoryBase);
  final HomeRepositoryBase homeRepositoryBase;

  Future<List<EmployeeDetailsBase>> call() async {
    return await homeRepositoryBase.getEmployeeDetails();
  }
}