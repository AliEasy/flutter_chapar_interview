import 'package:flutter_chapar_interview/core/di/error_handler/api_exception_handler.dart';
import 'package:flutter_chapar_interview/core/model/result.dart';
import 'package:flutter_chapar_interview/features/preview/data/data_source/submit_data_data_source.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_request_mapper.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_response_mapper.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_request_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/entity/submit_volunteer_response_entity.dart';
import 'package:flutter_chapar_interview/features/preview/domain/repository/submit_data_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubmitDataRepository)
class SubmitDataRepositoryImpl implements SubmitDataRepository {
  final SubmitDataDataSource _dataDataSource;

  SubmitDataRepositoryImpl(this._dataDataSource);

  @override
  Future<Result<SubmitVolunteerResponseEntity>> submitData(
    SubmitVolunteerRequestEntity requestData,
  ) async {
    try {
      final result = await _dataDataSource.submitData(requestData.mapper());
      return Result.success(data: result.data?.mapper());
    } catch (e) {
      return e.toResult();
    }
  }
}
