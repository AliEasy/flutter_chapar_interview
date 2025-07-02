import 'package:bloc/bloc.dart';
import 'package:flutter_chapar_interview/core/common/constants/regex.dart';
import 'package:flutter_chapar_interview/core/common/extensions/string_extension.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'personal_info_form_validator_state.dart';

part 'personal_info_form_validator_cubit.freezed.dart';

@injectable
class PersonalInfoFormValidatorCubit extends Cubit<PersonalInfoFormValidatorState> {
  PersonalInfoFormValidatorCubit()
    : super(const PersonalInfoFormValidatorState.invalid());

  PersonalInfoFormFieldsState _fullNameIsStatus = PersonalInfoFormFieldsState.empty;
  PersonalInfoFormFieldsState _emailIsStatus = PersonalInfoFormFieldsState.empty;
  PersonalInfoFormFieldsState _phoneIsStatus = PersonalInfoFormFieldsState.empty;
  PersonalInfoFormFieldsState _birthdayStatus = PersonalInfoFormFieldsState.empty;

  String? validateFullName(String? fullName) {
    final trimmed = fullName?.trim() ?? '';
    if (trimmed.length >= 3) {
      _fullNameIsStatus = PersonalInfoFormFieldsState.valid;
      _validateForm();
      return null;
    } else if (trimmed.isEmpty) {
      _fullNameIsStatus = PersonalInfoFormFieldsState.invalid;
      _validateForm();
      return S.current.full_name_is_required;
    } else {
      _fullNameIsStatus = PersonalInfoFormFieldsState.invalid;
      _validateForm();
      return S.current.full_name_min_char;
    }
  }

  String? validateEmail(String email) {
    final trimmed = email.trim();
    if (trimmed.isNotEmpty) {
      final isValid = RegExp(emailRegex).hasMatch(trimmed);
      if (isValid) {
        _emailIsStatus = PersonalInfoFormFieldsState.valid;
        _validateForm();
        return null;
      } else {
        _emailIsStatus = PersonalInfoFormFieldsState.invalid;
        _validateForm();
        return S.current.email_is_not_valid;
      }
    } else {
      _emailIsStatus = PersonalInfoFormFieldsState.empty;
      _validateForm();
      if (_phoneIsStatus != PersonalInfoFormFieldsState.valid) {
        return S.current.phone_or_email_must_be_provided;
      } else {
        return null;
      }
    }
  }

  String? validatePhone(String phone) {
    final trimmed = phone.trim();
    if (trimmed.isNotEmpty) {
      final isValid = RegExp(iranMobileNumberRegex).hasMatch(trimmed);
      if (isValid) {
        _phoneIsStatus = PersonalInfoFormFieldsState.valid;
        _validateForm();
        return null;
      } else {
        _phoneIsStatus = PersonalInfoFormFieldsState.invalid;
        _validateForm();
        return S.current.email_is_not_valid;
      }
    } else {
      _phoneIsStatus = PersonalInfoFormFieldsState.empty;
      _validateForm();
      if (_emailIsStatus != PersonalInfoFormFieldsState.valid) {
        return S.current.phone_or_email_must_be_provided;
      } else {
        return null;
      }
    }
  }

  String? validateBirthday(String birthday) {
    if (birthday.isNotEmpty) {
      final isValid = _isOver18(birthday);
      if (isValid) {
        _birthdayStatus = PersonalInfoFormFieldsState.valid;
        _validateForm();
        return null;
      } else {
        _birthdayStatus = PersonalInfoFormFieldsState.invalid;
        _validateForm();
        return S.current.age_min_is_18;
      }
    } else {
      _birthdayStatus = PersonalInfoFormFieldsState.empty;
      _validateForm();
      return S.current.birthday_is_required;
    }
  }

  _validateForm() {
    if (_fullNameIsStatus == PersonalInfoFormFieldsState.valid &&
        ((_emailIsStatus == PersonalInfoFormFieldsState.valid &&
                _phoneIsStatus != PersonalInfoFormFieldsState.invalid) ||
            (_phoneIsStatus == PersonalInfoFormFieldsState.valid &&
                _emailIsStatus != PersonalInfoFormFieldsState.invalid)) &&
        _birthdayStatus == PersonalInfoFormFieldsState.valid) {
      emit(const PersonalInfoFormValidatorState.valid());
    } else {
      emit(const PersonalInfoFormValidatorState.invalid());
    }
  }

  bool _isOver18(String birthday) {
    try {
      final birthdayDateTime = birthday.toDateTime();

      final today = DateTime.now();
      final age18Cutoff = DateTime(today.year - 18, today.month, today.day);

      return birthdayDateTime.isBefore(age18Cutoff) ||
          birthdayDateTime.isAtSameMomentAs(age18Cutoff);
    } catch (e) {
      return false;
    }
  }
}

enum PersonalInfoFormFieldsState { valid, invalid, empty }
