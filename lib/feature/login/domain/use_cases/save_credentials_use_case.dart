import 'package:flutter_study/feature/login/domain/entities/login_input_entity.dart';

import '../../data/repositories/credentials_repository.dart';

class SaveCredentialsUseCase {
  final CredentialsRepository credentialsRepository;

  SaveCredentialsUseCase({required this.credentialsRepository});

  Future<void> call({
    required String key,
    required LoginInputEntity credentials,
  }) async {
    await credentialsRepository.saveCredentials(key, credentials);
    return;
  }
}
