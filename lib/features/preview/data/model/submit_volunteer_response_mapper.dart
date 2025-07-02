import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_response_model.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';

extension OnSubmitVolunteerResponseModel on SubmitVolunteerResponseModel {
  SubmitVolunteerResponseEntity mapper() {
    return SubmitVolunteerResponseEntity(
      id: id,
      fullName: fullName,
      email: email,
      phone: phone,
      birthday: birthday,
      skills: skills,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
