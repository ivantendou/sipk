// To parse this JSON data, do
//
//     final fetchEightStepModel = fetchEightStepModelFromJson(jsonString);

import 'dart:convert';

FetchEightStepModel fetchEightStepModelFromJson(String str) => FetchEightStepModel.fromJson(json.decode(str));

String fetchEightStepModelToJson(FetchEightStepModel data) => json.encode(data.toJson());

class FetchEightStepModel {
    String? applicationCoverage;
    String? vehicleCollateralInsurance;
    String? applicantLifeInsurance;
    String? collateralBinding;

    FetchEightStepModel({
        this.applicationCoverage,
        this.vehicleCollateralInsurance,
        this.applicantLifeInsurance,
        this.collateralBinding,
    });

    factory FetchEightStepModel.fromJson(Map<String, dynamic> json) => FetchEightStepModel(
        applicationCoverage: json["application_coverage"],
        vehicleCollateralInsurance: json["vehicle_collateral_insurance"],
        applicantLifeInsurance: json["applicant_life_insurance"],
        collateralBinding: json["collateral_binding"],
    );

    Map<String, dynamic> toJson() => {
        "application_coverage": applicationCoverage,
        "vehicle_collateral_insurance": vehicleCollateralInsurance,
        "applicant_life_insurance": applicantLifeInsurance,
        "collateral_binding": collateralBinding,
    };
}
