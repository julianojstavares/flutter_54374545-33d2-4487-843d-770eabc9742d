
import '../../../../core/domain/entities/login_input_entity.dart';
import '../../../../core/domain/repositories/icredentials_repository.dart';

class RetrieveCredentialsUseCase {
  final ICredentialsRepository credentialsRepository;

  RetrieveCredentialsUseCase({required this.credentialsRepository});

  Future<LoginInputEntity?> call({required String key}) async {
    final credentials = await credentialsRepository.retrieveCredentials(key);
    return credentials;
  }
}
