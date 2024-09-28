part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final Email email;
  final Password password;
  final Name firstName;
  final bool isValid;
  final Role role;
  final PhoneNumber phoneNumber;
  final Address address;
  final int currentPageIndex;
  final FormzSubmissionStatus status;
  const RegisterState({
    this.currentPageIndex = 0,
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.firstName = const Name.pure(),
    this.role = const Role.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.address = const Address.pure(),
  });
  RegisterState copyWith({
    Email? email,
    Password? password,
    Name? firstName,
    Role? role,
    Address? address,
    PhoneNumber? phoneNumber,
    FormzSubmissionStatus? status,
    bool? isValid,
    int? currentPageIndex,
  }) {
    return RegisterState(
        email: email ?? this.email,
        isValid: isValid ?? this.isValid,
        password: password ?? this.password,
        address: address ?? this.address,
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        firstName: firstName ?? this.firstName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [
        email,
        password,
        firstName,
        isValid,
        phoneNumber,
        address,
        status,
        currentPageIndex,
        role
      ];
}

final class RegisterInitial extends RegisterState {}
