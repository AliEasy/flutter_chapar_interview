import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_chapar_interview/core/model/result.dart';
import 'package:flutter_chapar_interview/core/service/volunteer_data_service/entity/volunteer_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/use_case/submit_data_use_case.dart';
import 'package:flutter_chapar_interview/features/preview/presentation/manager/submit/submit_data_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSubmitDataUseCase extends Mock implements SubmitDataUseCase {}

class FakeSubmitVolunteerRequestEntity extends Fake implements SubmitVolunteerRequestEntity {}

main() {
  late SubmitDataCubit submitDataCubit;
  late MockSubmitDataUseCase mockSubmitDataUseCase;

  setUp(() {
    registerFallbackValue(FakeSubmitVolunteerRequestEntity());
    mockSubmitDataUseCase = MockSubmitDataUseCase();
    submitDataCubit = SubmitDataCubit(mockSubmitDataUseCase);
  });

  tearDown(() => submitDataCubit.close());

  final responseEntity = SubmitVolunteerResponseEntity(
    id: 0,
  );

  group('test SubmitDataCubit', () {
    blocTest<SubmitDataCubit, SubmitDataState>(
      'test submitData success',
      build: () {
        when(() => mockSubmitDataUseCase.call(any()))
            .thenAnswer((_) async => Result.success(data: responseEntity));
        return submitDataCubit;
      },
      act: (cubit) => cubit.submitData(VolunteerEntity(fullName: 'Ali')),
      expect:
          () => [
            const SubmitDataState.loading(),
            SubmitDataState.success(data: responseEntity),
          ],
    );

    blocTest<SubmitDataCubit, SubmitDataState>(
      'test submitData failure',
      build: () {
        when(() => mockSubmitDataUseCase.call(any()))
            .thenAnswer((_) async => const Result.failure(message: 'failure'));
        return submitDataCubit;
      },
      act: (cubit) => cubit.submitData(VolunteerEntity(fullName: 'Ali')),
      expect:
          () => [
            const SubmitDataState.loading(),
            const SubmitDataState.failure(message: 'failure'),
          ],
    );
  });
}
