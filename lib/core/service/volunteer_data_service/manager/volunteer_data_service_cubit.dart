import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/entity/volunteer_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class VolunteerDataService extends Cubit<VolunteerEntity> {
  VolunteerDataService() : super(VolunteerEntity());

  void savePersonalInfo({
    required String fullName,
    required String email,
    required String phone,
    required String birthday,
  }) {
    emit(
      state.copyWith(
        fullName: fullName,
        email: email,
        phone: phone,
        birthday: birthday,
      ),
    );
  }

  void saveSkills(List<String> skills) {
    emit(state.copyWith(skills: skills));
  }
}
