import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chapar_interview/core/di/base/di_setup.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/entity/volunteer_entity.dart';
import 'package:flutter_chapar_interview/core/uikit/button_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/scaffold_body_root_widget.dart';
import 'package:flutter_chapar_interview/core/uikit/toast.dart';
import 'package:flutter_chapar_interview/features/preview/presentation/manager/submit/submit_data_cubit.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';

@RoutePage()
class PreviewPage extends StatelessWidget {
  final VolunteerEntity volunteerEntity;

  const PreviewPage({super.key, required this.volunteerEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubmitDataCubit>(),
      child: BlocListener<SubmitDataCubit, SubmitDataState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              showErrorToast(context, message ?? S.of(context).unknown_error);
            },
            success: (data) {
              showSuccessToast(
                context,
                '${S.of(context).user_id_is} ${data?.id ?? 0}',
              );
            },
          );
        },
        child: Builder(
          builder:
              (context) => Scaffold(
                appBar: AppBar(title: Text(S.of(context).preview)),
                body: ScaffoldBodyRootWidget(
                  child: ListView(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          S.of(context).recheck_before_submit,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).full_name}: '),
                          Expanded(
                            child: Text(
                              volunteerEntity.fullName ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).email}: '),
                          Expanded(
                            child: Text(
                              volunteerEntity.email ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).phone}: '),
                          Expanded(
                            child: Text(
                              volunteerEntity.phone ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).birthday}: '),
                          Expanded(
                            child: Text(
                              volunteerEntity.birthday ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${S.of(context).skills}: '),
                          Expanded(
                            child: Text(
                              (volunteerEntity.skills ?? []).join(' - '),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                bottomNavigationBar: ScaffoldBodyRootWidget(
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
                        child: BlocBuilder<SubmitDataCubit, SubmitDataState>(
                          builder: (context, state) {
                            return state.whenOrNull(
                                  loading: () {
                                    return ButtonWidget(
                                      buttonType: ButtonType.filled,
                                      title: S.of(context).submit,
                                      isLoading: true,
                                    );
                                  },
                                ) ??
                                ButtonWidget(
                                  buttonType: ButtonType.filled,
                                  title: S.of(context).submit,
                                  onPressed: () {
                                    context.read<SubmitDataCubit>().submitData(
                                      volunteerEntity,
                                    );
                                  },
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
