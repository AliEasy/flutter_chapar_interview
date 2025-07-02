part of 'personal_info_form_validator_cubit.dart';

@freezed
class PersonalInfoFormValidatorState with _$PersonalInfoFormValidatorState {
  const factory PersonalInfoFormValidatorState.invalid() = _Invalid;
  const factory PersonalInfoFormValidatorState.valid() = _Valid;
}
