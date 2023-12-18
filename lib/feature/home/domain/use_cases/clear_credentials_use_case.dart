import '../../../../core/domain/repositories/icredentials_repository.dart';

class ClearCredentialsUseCase {
  final ICredentialsRepository credentialsRepository;

  ClearCredentialsUseCase({
    required this.credentialsRepository,
  });

  Future<void> call({required String key}) async {
    await credentialsRepository.clearCredentials(key);
    return;
  }
}
