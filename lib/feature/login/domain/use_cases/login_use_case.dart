import '../entities/login_input_entity.dart';
import '../repositories/ilogin_repository.dart';

class LoginUseCase {
  final ILoginRepository _repository;

  LoginUseCase({
    required ILoginRepository repository,
  }) : _repository = repository;

  Future<bool> execute(LoginInputEntity input) async {
    return await _repository.login(input);
  }
}
