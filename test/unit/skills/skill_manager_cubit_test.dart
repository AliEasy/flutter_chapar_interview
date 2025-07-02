import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_chapar_interview/features/skills/presentation/manager/skill_manager/skill_manager_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late SkillManagerCubit skillManagerCubit;

  setUp(() {
    skillManagerCubit = SkillManagerCubit();
  });

  tearDown(() => skillManagerCubit.close());

  group('test SkillManagerCubit', () {
    blocTest<SkillManagerCubit, SkillManagerState>(
      'test addOrRemoveSkill',
      build: () {
        return skillManagerCubit;
      },
      act: (cubit) => cubit.addOrRemoveSkill('skill'),
      expect:
          () => [
            const SkillManagerState.loading(),
            const SkillManagerState.skillsModified(skillList: <String>['skill']),
          ],
    );

    blocTest<SkillManagerCubit, SkillManagerState>(
      'test addInitialData',
      build: () {
        return skillManagerCubit;
      },
      act: (cubit) => cubit.addInitialData(['skill1', 'skill2']),
      expect:
          () => [
            const SkillManagerState.skillsModified(
              skillList: <String>['skill1', 'skill2'],
            ),
          ],
    );
  });
}
