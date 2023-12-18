
import '../entities/login_input_entity.dart';
import '../repositories/icredentials_repository.dart';

class SaveCredentialsUseCase {
  final ICredentialsRepository credentialsRepository;

  SaveCredentialsUseCase({required this.credentialsRepository});

  Future<void> call({
    required String key,
    required LoginInputEntity credentials,
  }) async {
    await credentialsRepository.saveCredentials(key, credentials);
    return;
  }
}
