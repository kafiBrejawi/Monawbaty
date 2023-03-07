part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  final String error;

  RegistrationFailure(this.error);
}

class RegistrationPasswordVisibility extends RegistrationState {}

class RegistrationChangeNotifier extends RegistrationState {}
