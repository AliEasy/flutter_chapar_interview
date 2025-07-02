import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'skill_manager_state.dart';

part 'skill_manager_cubit.freezed.dart';

@injectable
class SkillManagerCubit extends Cubit<SkillManagerState> {
  SkillManagerCubit() : super(const SkillManagerState.initial());

  final List<String> _skillList = [];

  addInitialData(List<String> skills) {
    _skillList.addAll(skills);
    emit(SkillManagerState.skillsModified(skillList: _skillList));
  }

  addOrRemoveSkill(String skill) {
    if (skill.isNotEmpty) {
      emit(const SkillManagerState.loading());
      final exists = _skillList.any((element) => element == skill);
      if (exists) {
        _skillList.remove(skill);
      } else {
        _skillList.add(skill);
      }
      emit(SkillManagerState.skillsModified(skillList: _skillList));
    }
  }

  List<String> get skillList => _skillList;
}
