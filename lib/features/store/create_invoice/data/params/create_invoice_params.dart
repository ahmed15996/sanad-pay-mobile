import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_invoice_params.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: true)
class CreateInvoiceParams {
  final String phone, total;

  CreateInvoiceParams({
    required this.phone,
    required this.total,

  });

  Map<String, dynamic> toJson() => _$CreateInvoiceParamsToJson(this);
}
