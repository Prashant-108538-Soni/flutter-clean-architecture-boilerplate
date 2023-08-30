import 'package:clean_architecture_model/home/presentation/view/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'core/util/device_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        DeviceConfig.init(context);
        return Column(
          children: [
            Expanded(
              child: child ?? const Text('404'),
            ),
          ],
        );
      },

      /// check here if user is an authentic user then navigate it to home screen other wise navigate it to authenticated view.( login page )
      // home: AuthDatasource.instance.isAuthenticated.value
      //           ? const HomeView()
      //           : const AuthView(),
      home: const HomeView(),
    );
  }
}