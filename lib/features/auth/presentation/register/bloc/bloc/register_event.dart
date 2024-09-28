part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

//email
class EmailChange extends RegisterEvent {
  final String email;
  const EmailChange({required this.email});
}

//first name change
class FirstNameChange extends RegisterEvent {
  final String firstName;
  const FirstNameChange({required this.firstName});
}

class LastNameChange extends RegisterEvent {
  final String lastName;
  const LastNameChange({required this.lastName});
}

//last name change
class PasswordChange extends RegisterEvent {
  final String password;
  const PasswordChange({required this.password});
}

//phone number
class PhoneNumberChange extends RegisterEvent {
  final String phoneNumber;
  const PhoneNumberChange({required this.phoneNumber});
}

//address
class AddressChange extends RegisterEvent {
  final String address;
  const AddressChange({required this.address});
}

//role
class RoleChange extends RegisterEvent {
  final String role;
  const RoleChange({required this.role});
}

class ToggleButtonPressed extends RegisterEvent{
  final int pageIndex;
  const ToggleButtonPressed({required this.pageIndex});
}

class RegisterButtonPressed extends RegisterEvent {}
