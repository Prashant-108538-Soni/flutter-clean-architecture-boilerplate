import 'package:clean_architecture_model/auth/data/model/login_config_model.dart';
import 'package:clean_architecture_model/auth/domain/repo/repo.dart';

class LoginUsecase
{
  LoginUsecase(this.repository);
  final AuthRepositoryBase repository;

  /// call method is calling method of repo.dart of DOMAIN LAYER..
  Future<LoginConfigModel?> call() async {
    // return repository.getLoginInfo();
    return null;
  }

}