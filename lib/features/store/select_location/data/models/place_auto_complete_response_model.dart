import 'dart:convert';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePrediction>? predictions;

  PlaceAutoCompleteResponse({this.status, this.predictions});

  factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteResponse(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
          ? List<AutoCompletePrediction>.from(json['predictions']
          .map((prediction) => AutoCompletePrediction.fromJson(prediction)))
          : null,
    );
  }

  static PlaceAutoCompleteResponse parseAutoCompleteResult(
      String responseBody) {
    final parsed = jsonDecode(responseBody);
    return PlaceAutoCompleteResponse.fromJson(parsed);
  }
}

class AutoCompletePrediction {
  final String? description;
  final String? placeId;
  final String? reference;
  final StructureFormatting? structureFormatting;

  AutoCompletePrediction(
      {this.description,
        this.placeId,
        this.reference,
        this.structureFormatting});

  factory AutoCompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutoCompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structureFormatting: json['structured_formatting'] != null
          ? StructureFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }
}

class StructureFormatting {
  final String? mainTest;
  final String? secondaryText;

  StructureFormatting({this.mainTest, this.secondaryText});

  factory StructureFormatting.fromJson(Map<String, dynamic> json) {
    return StructureFormatting(
      mainTest: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}
