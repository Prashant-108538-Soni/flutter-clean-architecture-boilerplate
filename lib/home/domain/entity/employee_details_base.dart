import 'package:equatable/equatable.dart';
abstract class EmployeeDetailsBase extends Equatable
{
  const EmployeeDetailsBase({
   required this.id,
   required this.employeeAge,
   required this.employeeName,
   required this.employeeSalary,
   required this.profileImage
});
  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;
  final String profileImage;
}