
import 'dart:ui';

import 'package:flutter_chapar_interview/features/personal_info/presentation/manager/form_validation/personal_info_form_validator_cubit.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  late PersonalInfoFormValidatorCubit personalInfoFormValidatorCubit;

  setUp(() async {
    personalInfoFormValidatorCubit = PersonalInfoFormValidatorCubit();
    await initializeDateFormatting();
    await S.load(const Locale('en'));
  });

  tearDown(() => personalInfoFormValidatorCubit.close());

  group('test PersonalInfoFormValidatorCubit', () {
    test('initial state is invalid', () {
      expect(personalInfoFormValidatorCubit.state, const PersonalInfoFormValidatorState.invalid());
    });

    test('valid email and password emits valid state', () {
      final nameError = personalInfoFormValidatorCubit.validateFullName('ali');
      final emailError = personalInfoFormValidatorCubit.validateEmail('test@example.com');
      final passwordError = personalInfoFormValidatorCubit.validatePhone('09123456789');
      final birthdayError = personalInfoFormValidatorCubit.validateBirthday('1999-10-5');

      expect(nameError, isNull);
      expect(emailError, isNull);
      expect(passwordError, isNull);
      expect(birthdayError, isNull);
      expect(personalInfoFormValidatorCubit.state, const PersonalInfoFormValidatorState.valid());
    });
  });
}