import 'package:clean_architecture_model/home/data/datasource/remote_datasource.dart';
import 'package:clean_architecture_model/home/data/repo/repo.dart';
import 'package:clean_architecture_model/home/domain/usecase/employee_details_usecase.dart';
import 'package:clean_architecture_model/home/presentation/logic/employee_details_view_controller.dart';
import 'package:clean_architecture_model/home/presentation/view_state/employee_details_view_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmployeeDetailsController>(
      create: (_) {
        final repository = HomeRepository(RemoteDatasource.instance);
        return EmployeeDetailsController(employeeDetailsUsecase: EmployeeDetailsUsecase(repository));
      },
      builder: (_, __) {
        return Consumer<EmployeeDetailsController>(
          builder: (_, controller, __) {
            return RefreshIndicator(
              strokeWidth: 0,
              onRefresh: controller.onRefresh,
              child: ValueListenableBuilder<EmployeeDetailsViewState>(
                  valueListenable: controller.employeeDetailsViewState,
                  builder: (context, employeeDetailsViewState, _) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Employee Details'),),
                      body: Builder(
                        builder: (_) {
                          if (!employeeDetailsViewState.started) {
                            return const SizedBox.shrink();
                          }
                          if (employeeDetailsViewState.isBusy) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 64.0),
                                child: SizedBox(width: 24.0, height: 24.0, child: CircularProgressIndicator()),
                              ),
                            );
                          }
                          if (!employeeDetailsViewState.isSuccess) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 32.0),
                                child: Text(
                                  'Something Went Wrong',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }
                          return ListView.separated(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: employeeDetailsViewState.employeeDetails!.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                            itemBuilder: (context, index) {
                              final employeeDetails = employeeDetailsViewState.employeeDetails![index];
                              return StatefulBuilder(
                                builder: (_, refresh) {
                                  return ListTile(
                                    title: Text(employeeDetails.employeeName),
                                    subtitle: Text(employeeDetails.employeeSalary.toString()),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
            );
          },
        );
      },
    );
  }
}
