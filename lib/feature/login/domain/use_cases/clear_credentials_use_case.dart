import '../../data/repositories/credentials_repository.dart';

class ClearCredentialsUseCase {
  final CredentialsRepository credentialsRepository;

  ClearCredentialsUseCase({
    required this.credentialsRepository,
  });

  Future<void> call({required String key}) async {
    await credentialsRepository.clearCredentials(key);
    return;
  }
}
