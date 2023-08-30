import 'package:clean_architecture_model/home/domain/entity/employee_details_base.dart';

class EmployeeDetailsModel extends EmployeeDetailsBase
{
  const EmployeeDetailsModel({
    required super.id,
    required super.employeeAge,
    required super.employeeName,
    required super.employeeSalary,
    required super.profileImage
  });

  factory EmployeeDetailsModel.fromJson(Map<String, dynamic> json) => EmployeeDetailsModel(
    id: int.parse(json["id"].toString()),
    employeeAge: int.parse(json["employee_age"].toString()),
    employeeName: json["employee_name"].toString(),
    employeeSalary: int.parse(json["employee_salary"].toString()),
    profileImage: json["profile_image"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_age": employeeAge,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "profile_image": profileImage,
  };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
