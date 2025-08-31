import 'package:json_annotation/json_annotation.dart';

part 'send_financing_request_params.g.dart';

@JsonSerializable(createFactory: false)
class SendFinancingRequestParams {
  @JsonKey(name: "national_id")
  final String nationalId;
  @JsonKey(name: "date_of_birth")
  final String dateOfBirth;
  final String occupation,salary;
  @JsonKey(name: "job_start_date")
  final String jobStartDate;


  SendFinancingRequestParams(
      {
        required this.nationalId,
        required this.dateOfBirth,
        required this.occupation,
        required this.salary,
        required this.jobStartDate
});

  Map<String, dynamic> toJson() => _$SendFinancingRequestParamsToJson(this);
}
