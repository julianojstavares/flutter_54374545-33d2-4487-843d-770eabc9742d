mixin FormValidatorMixin {
 String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira um nome de usuário';
  }
  if (value.endsWith(' ')) {
    return 'Nome de usuário não pode terminar com um espaço';
  }
  return null;
 }

 String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira uma senha';
  }
  if (value.length < 2) {
    return 'Senha deve ter pelo menos 2 caracteres';
  }
  if (value.endsWith(' ')) {
    return 'Senha não pode terminar com um espaço';
  }
  return null;
 }
}