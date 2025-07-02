import 'package:flutter_chapar_interview/core/model/base_response.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_request_model.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_response_model.dart';

abstract interface class SubmitDataDataSource {
  Future<BaseSingleResponse<SubmitVolunteerResponseModel>> submitData(SubmitVolunteerRequestModel requestData);
}