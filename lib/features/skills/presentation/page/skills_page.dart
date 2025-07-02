import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chapar_interview/core/di/base/di_setup.dart';
import 'package:flutter_chapar_interview/core/di/routes/app_router.gr.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/entity/volunteer_entity.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/manager/volunteer_data_service_cubit.dart';
import 'package:flutter_chapar_interview/core/uikit/button_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/scaffold_body_root_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/scaffold_bottom_navigator_bar_root_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/text_form_field_widget.dart';
import 'package:flutter_chapar_interview/features/skills/presentation/manager/skill_manager/skill_manager_cubit.dart';
import 'package:flutter_chapar_interview/features/skills/presentation/widgets/skill_item_widget.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';

@RoutePage()
class SkillsPage extends StatefulWidget {
  final VolunteerEntity volunteerEntity;

  const SkillsPage({super.key, required this.volunteerEntity});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final _skillNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<SkillManagerCubit>();
        cubit.addInitialData(widget.volunteerEntity.skills ?? []);
        return cubit;
      },
      child: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).skills),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: _skillNameController,
                            label: S.of(context).skill_name,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ButtonWidget(
                          buttonType: ButtonType.outlined,
                          title: S.of(context).add_skill,
                          icon: const Icon(Icons.add_rounded),
                          onPressed: () {
                            context.read<SkillManagerCubit>().addOrRemoveSkill(
                              _skillNameController.text,
                            );
                            _skillNameController.clear();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: ScaffoldBodyRootWidget(
                child: BlocBuilder<SkillManagerCubit, SkillManagerState>(
                  builder: (context, state) {
                    return state.whenOrNull(
                          skillsModified: (skillList) {
                            if (skillList.isNotEmpty) {
                              return Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children:
                                    skillList.map((skill) {
                                      return SkillItemWidget(
                                        skill: skill,
                                        onTap: () {
                                          context
                                              .read<SkillManagerCubit>()
                                              .addOrRemoveSkill(skill);
                                        },
                                      );
                                    }).toList(),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  S.of(context).skill_minimum_to_continue,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          },
                        ) ??
                        const SizedBox();
                  },
                ),
              ),
              bottomNavigationBar: ScaffoldBottomNavigatorBarRootWidget(
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        buttonType: ButtonType.outlined,
                        title: S.of(context).previous,
                        onPressed: () {
                          context.maybePop();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BlocBuilder<SkillManagerCubit, SkillManagerState>(
                        builder: (context, state) {
                          return state.whenOrNull(
                                skillsModified: (skillList) {
                                  if (skillList.isEmpty) {
                                    return ButtonWidget(
                                      buttonType: ButtonType.filled,
                                      title: S.of(context).next,
                                    );
                                  } else {
                                    return ButtonWidget(
                                      buttonType: ButtonType.filled,
                                      title: S.of(context).next,
                                      onPressed: () {
                                        final skillList =
                                            context
                                                .read<SkillManagerCubit>()
                                                .skillList;
                                        context
                                            .read<VolunteerDataService>()
                                            .saveSkills(skillList);
                                        context.pushRoute(
                                          PreviewRoute(
                                            volunteerEntity:
                                                context
                                                    .read<VolunteerDataService>()
                                                    .state,
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ) ??
                              ButtonWidget(
                                buttonType: ButtonType.filled,
                                title: S.of(context).next,
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  @override
  void dispose() {
    _skillNameController.dispose();
    super.dispose();
  }
}
