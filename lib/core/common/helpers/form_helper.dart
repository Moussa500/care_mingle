
import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart';

enum PasswordValidationError {
  empty,
  invalid,
  short,
  noUpperCase,
  noLowerCase,
  noDigit,
  noSpecial
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.short;
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return PasswordValidationError.noUpperCase;
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return PasswordValidationError.noLowerCase;
    }
    if (!value.contains(RegExp(r'[0.9]'))) {
      return PasswordValidationError.noDigit;
    }
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/`~;\s]'))) {
      return PasswordValidationError.noSpecial;
    }
    return null;
  }
}

enum EmailValidatorError { empty, invalid, noDomain }

class Email extends FormzInput<String, EmailValidatorError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  @override
  EmailValidatorError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidatorError.empty;
    }
    if (value.contains('@example.com')) {
      return EmailValidatorError.empty;
    }
    if (!_emailRegex.hasMatch(value)) {
      return EmailValidatorError.noDomain;
    }
    if (!_emailRegex.hasMatch(value)) {
      return EmailValidatorError.invalid;
    }
    return null;
  }
}

enum NameValidatorError { empty, invalid }

class Name extends FormzInput<String, NameValidatorError> {
  const Name.pure() : super.pure('');
  const Name.dirty([super.value = '']) : super.dirty();
  @override
  NameValidatorError? validator(String value) {
    if (value.isEmpty) {
      return NameValidatorError.empty;
    }
    if (!value.isAlpha) {
      return NameValidatorError.invalid;
    }
    return null;
  }
}
enum RoleValidatorError{empty}
class Role extends FormzInput<String,RoleValidatorError>{
  const Role.pure():super.pure('');
const Role.dirty([super.value='']):super.dirty();

  @override
  RoleValidatorError? validator(String value) {
    if (value.isEmpty) {
      return RoleValidatorError.empty;
    }
    return null;
  }
}
enum AddressValidatorError{empty}
class Address extends FormzInput<String,AddressValidatorError>{
  const Address.pure():super.pure('');
const Address.dirty([super.value='']):super.dirty();
  @override
  AddressValidatorError? validator(String value) {
    if (value.isEmpty) {
      return AddressValidatorError.empty;
    }
    return null;
  }
}
enum PhoneNumberValidatorError{empty,invalid}
class PhoneNumber extends FormzInput<String,PhoneNumberValidatorError>{
  const PhoneNumber.pure():super.pure('');
const PhoneNumber.dirty([super.value='']):super.dirty();

  @override
  PhoneNumberValidatorError? validator(String value) {
    if (value.isEmpty) {
      return PhoneNumberValidatorError.empty;
    }
    if (value.length!=8||!isNumeric(value)) {
      return PhoneNumberValidatorError.invalid;
    }
    return null;
  }
}