import '../../data/repositories/credentials_repository.dart';
import '../entities/login_input_entity.dart';

class RetrieveCredentialsUseCase {
  final CredentialsRepository credentialsRepository;

  RetrieveCredentialsUseCase({required this.credentialsRepository});

  Future<LoginInputEntity?> call({required String key}) async {
    final credentials = await credentialsRepository.retrieveCredentials(key);
    return credentials;
  }
}
