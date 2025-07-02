import 'package:flutter_chapar_interview/core/model/result.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';

abstract interface class SubmitDataRepository {
  Future<Result<SubmitVolunteerResponseEntity>> submitData(SubmitVolunteerRequestEntity requestData);
}