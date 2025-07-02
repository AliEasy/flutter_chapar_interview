import 'package:bloc/bloc.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/entity/volunteer_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/use_case/submit_data_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'submit_data_state.dart';

part 'submit_data_cubit.freezed.dart';

@injectable
class SubmitDataCubit extends Cubit<SubmitDataState> {
  final SubmitDataUseCase _submitDataUseCase;

  SubmitDataCubit(this._submitDataUseCase) : super(const SubmitDataState.initial());

  submitData(VolunteerEntity data) async {
    emit(const SubmitDataState.loading());
    final result = await _submitDataUseCase.call(
      SubmitVolunteerRequestEntity(
        fullName: data.fullName,
        email: data.email,
        phone: data.phone,
        birthday: data.birthday,
        skills: data.skills,
      ),
    );
    result.whenOrNull(
      success: (data) {
        emit(SubmitDataState.success(data: data));
      },
      failure: (message) {
        emit(SubmitDataState.failure(message: message));
      },
    );
  }
}
