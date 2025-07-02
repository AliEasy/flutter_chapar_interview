import 'package:flutter_chapar_interview/core/model/base_use_case.dart';
import 'package:flutter_chapar_interview/core/model/result.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/repository/submit_data_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitDataUseCase extends BaseUseCase<Result<SubmitVolunteerResponseEntity>, SubmitVolunteerRequestEntity> {
  final SubmitDataRepository _repository;

  SubmitDataUseCase(this._repository);


  @override
  Future<Result<SubmitVolunteerResponseEntity>> call(SubmitVolunteerRequestEntity requestData) async {
    return _repository.submitData(requestData);
  }
}
