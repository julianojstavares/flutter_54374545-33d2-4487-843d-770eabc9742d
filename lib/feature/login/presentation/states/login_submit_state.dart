sealed class LoginSubmitState {}

final class LoginSubmitInitial extends LoginSubmitState {}

final class LoginSubmitLoading extends LoginSubmitState {}

final class LoginSubmitSuccess extends LoginSubmitState {}

final class LoginSubmitError extends LoginSubmitState {
  final String errorMessage;

  LoginSubmitError(this.errorMessage);
}