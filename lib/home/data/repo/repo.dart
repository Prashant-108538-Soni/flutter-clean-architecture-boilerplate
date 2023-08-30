import 'package:clean_architecture_model/home/data/datasource/remote_datasource.dart';
import 'package:clean_architecture_model/home/data/model/employee_details_model.dart';
import 'package:clean_architecture_model/home/domain/repo/repo.dart';

class HomeRepository extends HomeRepositoryBase
{
  HomeRepository(this.remoteDatasource);

  final RemoteDatasource remoteDatasource;

  @override
  Future<List<EmployeeDetailsModel>> getEmployeeDetails() async {
    return await remoteDatasource.getEmployeeDetails();
  }

}