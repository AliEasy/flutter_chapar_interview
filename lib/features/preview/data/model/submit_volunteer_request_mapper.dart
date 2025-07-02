import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_request_model.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';

extension OnSubmitVolunteerRequestEntity on SubmitVolunteerRequestEntity {
  SubmitVolunteerRequestModel mapper() {
    return SubmitVolunteerRequestModel(
      fullName: fullName,
      email: email,
      phone: phone,
      birthday: birthday,
      skills: skills,
    );
  }
}
