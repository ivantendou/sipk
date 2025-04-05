// To parse this JSON data, do
//
//     final fetchFifthStepModel = fetchFifthStepModelFromJson(jsonString);

import 'dart:convert';

FetchFifthStepModel fetchFifthStepModelFromJson(String str) =>
    FetchFifthStepModel.fromJson(json.decode(str));

String fetchFifthStepModelToJson(FetchFifthStepModel data) =>
    json.encode(data.toJson());

class FetchFifthStepModel {
  int? sales;
  int? cogs;
  int? dailyLabor;
  int? consumption;
  int? transportCosts;
  int? fuel;
  int? packaging;
  int? depreciation;
  int? otherCosts;
  int? activeDays;
  int? monthlyLabor;
  int? rental;
  int? assetMaintenance;
  int? utilities;

  FetchFifthStepModel({
    this.sales,
    this.cogs,
    this.dailyLabor,
    this.consumption,
    this.transportCosts,
    this.fuel,
    this.packaging,
    this.depreciation,
    this.otherCosts,
    this.activeDays,
    this.monthlyLabor,
    this.rental,
    this.assetMaintenance,
    this.utilities,
  });

  factory FetchFifthStepModel.fromJson(Map<String, dynamic> json) =>
      FetchFifthStepModel(
        sales: (json['sales'] as num?)?.toInt(),
        cogs: (json['cogs'] as num?)?.toInt(),
        dailyLabor: (json['daily_labor'] as num?)?.toInt(),
        consumption: (json['consumption'] as num?)?.toInt(),
        transportCosts: (json['transport_costs'] as num?)?.toInt(),
        fuel: (json['fuel'] as num?)?.toInt(),
        packaging: (json['packaging'] as num?)?.toInt(),
        depreciation: (json['depreciation'] as num?)?.toInt(),
        otherCosts: (json['other_costs'] as num?)?.toInt(),
        activeDays: (json['active_days'] as num?)?.toInt(),
        monthlyLabor: (json['monthly_labor'] as num?)?.toInt(),
        rental: (json['rental'] as num?)?.toInt(),
        assetMaintenance: (json['asset_maintenance'] as num?)?.toInt(),
        utilities: (json['utilities'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        "sales": sales,
        "cogs": cogs,
        "daily_labor": dailyLabor,
        "consumption": consumption,
        "transport_costs": transportCosts,
        "fuel": fuel,
        "packaging": packaging,
        "depreciation": depreciation,
        "other_costs": otherCosts,
        "active_days": activeDays,
        "monthly_labor": monthlyLabor,
        "rental": rental,
        "asset_maintenance": assetMaintenance,
        "utilities": utilities,
      };
}
