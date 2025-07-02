import 'package:dio/dio.dart';
import 'package:flutter_chapar_interview/core/common/constants/network.dart';
import 'package:flutter_chapar_interview/core/model/base_response.dart';
import 'package:flutter_chapar_interview/features/preview/data/data_source/submit_data_data_source.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_request_model.dart';
import 'package:flutter_chapar_interview/features/preview/data/model/submit_volunteer_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubmitDataDataSource)
class SubmitDataDataSourceImpl implements SubmitDataDataSource {
  final Dio _dio;

  SubmitDataDataSourceImpl(this._dio);

  @override
  Future<BaseSingleResponse<SubmitVolunteerResponseModel>> submitData(
    SubmitVolunteerRequestModel requestData,
  ) async {
    final result = await _dio.post(submitDataPath, data: requestData.toJson());
    return BaseSingleResponse.fromJson(result.data, SubmitVolunteerResponseModel.fromJson);
  }
}
