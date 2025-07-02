part of 'submit_data_cubit.dart';

@freezed
class SubmitDataState with _$SubmitDataState {
  const factory SubmitDataState.initial() = _Initial;
  const factory SubmitDataState.loading() = _Loading;
  const factory SubmitDataState.failure({String? message}) = _Failure;
  const factory SubmitDataState.success({SubmitVolunteerResponseEntity? data}) = _Success;
}
