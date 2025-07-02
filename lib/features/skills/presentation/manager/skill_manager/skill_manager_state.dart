part of 'skill_manager_cubit.dart';

@freezed
class SkillManagerState with _$SkillManagerState {
  const factory SkillManagerState.initial() = _Initial;
  const factory SkillManagerState.loading() = _Loading;
  const factory SkillManagerState.skillsModified({required List<String> skillList}) = _SkillsModified;
}
