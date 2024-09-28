
import 'package:bloc/bloc.dart';
import 'package:care_mingle/core/common/helpers/form_helper.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:care_mingle/features/auth/domain/usecases/register.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<EmailChange>(_onEmailChange);
    on<FirstNameChange>(_onFirstNameChange);
    on<PhoneNumberChange>(_onPhoneNumberChange);
    on<AddressChange>(_onAddressChange);
    on<PasswordChange>(_onPasswordChange);
    on<RoleChange>(_onRoleChange);
    on<ToggleButtonPressed>(_onToggle);

    on<RegisterButtonPressed>(_onSubmitted);
  }
  PageController pageController = PageController();

  //fild value change
  void _onEmailChange(EmailChange event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([
          email,
          state.password,
          state.firstName,
          state.role,
          state.phoneNumber,
          state.address,
        ])));
  }

  // First Name Change
  void _onFirstNameChange(FirstNameChange event, Emitter<RegisterState> emit) {
    final firstName = Name.dirty(event.firstName);
    emit(state.copyWith(
      firstName: firstName,
      isValid: Formz.validate([
        state.email,
        state.password,
        firstName,
        state.role,
        state.phoneNumber,
        state.address,
      ]),
    ));
  }

// Phone Number Change
  void _onPhoneNumberChange(
      PhoneNumberChange event, Emitter<RegisterState> emit) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      isValid: Formz.validate([
        state.email,
        state.password,
        state.firstName,
        state.role,
        phoneNumber,
        state.address,
      ]),
    ));
  }

// Address Change
  void _onAddressChange(AddressChange event, Emitter<RegisterState> emit) {
    final address = Address.dirty(event.address);
    emit(state.copyWith(
      address: address,
      isValid: Formz.validate([
        state.email,
        state.password,
        state.firstName,
        state.role,
        state.phoneNumber,
        address,
      ]),
    ));
  }

// Password Change
  void _onPasswordChange(PasswordChange event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([
        state.email,
        password,
        state.firstName,
        state.role,
        state.phoneNumber,
        state.address,
      ]),
    ));
  }

// Role Change
  void _onRoleChange(RoleChange event, Emitter<RegisterState> emit) {
    final role = Role.dirty(event.role);
    emit(state.copyWith(
      role: role,
      isValid: Formz.validate([
        state.email,
        state.password,
        state.firstName,
        role,
        state.phoneNumber,
        state.address,
      ]),
    ));
  }

  void _onToggle(ToggleButtonPressed event, Emitter<RegisterState> emit) {
    pageController.nextPage(
        duration: const Duration(milliseconds: 30), curve: Curves.linear);
    emit(state.copyWith(currentPageIndex: event.pageIndex));
  }

  Future<void> _onSubmitted(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Email.dirty(state.password.value);
    final firstName = Name.dirty(state.firstName.value);
    final role = Role.dirty(state.role.value);
    final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    final address = PhoneNumber.dirty(state.address.value);
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        if (role.value == "babySitter") {
          final response =
              await sl<RegisterBabySitterUseCase>().call(BabySitterModel(
            address: address.value,
            bio: "Professional BabySitter available on the weekend",
            email: email.value,
            name: firstName.value,
            password: password.value,
            phone: phoneNumber.value,
            price: 500,
            rating: 0,
            role: role.value,
            status: "unbanned",
          ));
          print(state.isValid);

          response.fold((l) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
          }, (r) {
            emit(state.copyWith(status: FormzSubmissionStatus.success));
          });
        }
      } catch (e) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
        print("Error: $e");
      }
    }
  }
}
