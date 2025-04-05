// To parse this JSON data, do
//
//     final fetchSixthStepModel = fetchSixthStepModelFromJson(jsonString);

import 'dart:convert';

FetchSixthStepModel fetchSixthStepModelFromJson(String str) => FetchSixthStepModel.fromJson(json.decode(str));

String fetchSixthStepModelToJson(FetchSixthStepModel data) => json.encode(data.toJson());

class FetchSixthStepModel {
    String? residenceOwnership;
    int? residenceDuration;
    String? neighborhoodReputation;

    FetchSixthStepModel({
        this.residenceOwnership,
        this.residenceDuration,
        this.neighborhoodReputation,
    });

    factory FetchSixthStepModel.fromJson(Map<String, dynamic> json) => FetchSixthStepModel(
        residenceOwnership: json["residence_ownership"],
        residenceDuration: json["residence_duration"],
        neighborhoodReputation: json["neighborhood_reputation"],
    );

    Map<String, dynamic> toJson() => {
        "residence_ownership": residenceOwnership,
        "residence_duration": residenceDuration,
        "neighborhood_reputation": neighborhoodReputation,
    };
}
