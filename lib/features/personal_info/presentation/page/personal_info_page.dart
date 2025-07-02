import 'package:flutter/material.dart';
import 'package:flutter_chapar_interview/core/common/extensions/string_extension.dart';
import 'package:flutter_chapar_interview/core/di/base/di_setup.dart';
import 'package:flutter_chapar_interview/core/uikit/button_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/date_picker_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/scaffold_body_root_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/scaffold_bottom_navigator_bar_root_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/text_form_field_widget.dart';
import 'package:flutter_chapar_interview/features/personal_info/presentation/manager/form_validation/personal_info_form_validator_cubit.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PersonalInfoFormValidatorCubit>(),
      child: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: Text(S.of(context).personal_info)),
              body: ScaffoldBodyRootWidget(
                child: ListView(
                  children: [
                    TextFormFieldWidget(
                      controller: _fullNameController,
                      label: S.of(context).full_name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return context
                            .read<PersonalInfoFormValidatorCubit>()
                            .validateFullName(value ?? '');
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _emailController,
                      label: S.of(context).email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return context
                            .read<PersonalInfoFormValidatorCubit>()
                            .validateEmail(value ?? '');
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _phoneController,
                      label: S.of(context).phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return context
                            .read<PersonalInfoFormValidatorCubit>()
                            .validatePhone(value ?? '');
                      },
                    ),
                    const SizedBox(height: 16),
                    DatePickerWidget(
                      controller: _birthdayController,
                      label: S.of(context).birthday,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialDate: _birthdayController.text.toDateTime(),
                      validator: (value) {
                        return context
                            .read<PersonalInfoFormValidatorCubit>()
                            .validateBirthday(value ?? '');
                      },
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: ScaffoldBottomNavigatorBarRootWidget(
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<
                        PersonalInfoFormValidatorCubit,
                        PersonalInfoFormValidatorState
                      >(
                        builder: (context, state) {
                          final isEnabled = state.whenOrNull(valid: () => true,) ?? false;
                          return ButtonWidget(
                            buttonType: ButtonType.filled,
                            title: S.of(context).next,
                            onPressed: isEnabled ? () {} : null,
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
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();

    super.dispose();
  }
}
