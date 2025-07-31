// To parse this JSON data, do
//
//     final fetchFirstStepModel = fetchFirstStepModelFromJson(jsonString);

import 'dart:convert';

FetchFirstStepModel fetchFirstStepModelFromJson(String str) => FetchFirstStepModel.fromJson(json.decode(str));

String fetchFirstStepModelToJson(FetchFirstStepModel data) => json.encode(data.toJson());

class FetchFirstStepModel {
    Applicant? applicant;
    CreditEvaluation? creditEvaluation;
    Spouse? spouse;

    FetchFirstStepModel({
        this.applicant,
        this.creditEvaluation,
        this.spouse,
    });

    factory FetchFirstStepModel.fromJson(Map<String, dynamic> json) => FetchFirstStepModel(
        applicant: json["applicant"] == null ? null : Applicant.fromJson(json["applicant"]),
        creditEvaluation: json["creditEvaluation"] == null ? null : CreditEvaluation.fromJson(json["creditEvaluation"]),
        spouse: json["spouse"] == null ? null : Spouse.fromJson(json["spouse"]),
    );

    Map<String, dynamic> toJson() => {
        "applicant": applicant?.toJson(),
        "creditEvaluation": creditEvaluation?.toJson(),
        "spouse": spouse?.toJson(),
    };
}

class Applicant {
    int? id;
    String? name;
    String? ktpNumber;
    String? residentialAddress;
    String? regency;
    String? province;
    String? postalCode;
    String? placeOfBirth;
    DateTime? dateOfBirth;
    String? motherName;
    String? homePhone;
    String? mobilePhone;
    String? gender;
    String? ktpAddress;
    String? companyName;
    String? companyAddress;
    String? bossName;

    Applicant({
        this.id,
        this.name,
        this.ktpNumber,
        this.residentialAddress,
        this.regency,
        this.province,
        this.postalCode,
        this.placeOfBirth,
        this.dateOfBirth,
        this.motherName,
        this.homePhone,
        this.mobilePhone,
        this.gender,
        this.ktpAddress,
        this.companyName,
        this.companyAddress,
        this.bossName,
    });

    factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        id: json["id"],
        name: json["name"],
        ktpNumber: json["ktp_number"],
        residentialAddress: json["residential_address"],
        regency: json["regency"],
        province: json["province"],
        postalCode: json["postal_code"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        motherName: json["mother_name"],
        homePhone: json["home_phone"],
        mobilePhone: json["mobile_phone"],
        gender: json["gender"],
        ktpAddress: json["ktp_address"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        bossName: json["boss_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ktp_number": ktpNumber,
        "residential_address": residentialAddress,
        "regency": regency,
        "province": province,
        "postal_code": postalCode,
        "place_of_birth": placeOfBirth,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "mother_name": motherName,
        "home_phone": homePhone,
        "mobile_phone": mobilePhone,
        "gender": gender,
        "ktp_address": ktpAddress,
        "company_name": companyName,
        "company_address": companyAddress,
        "boss_name": bossName,
    };
}

class CreditEvaluation {
    int? applicantId;
    int? applicantAge;
    String? applicantCategory;
    String? maritalStatus;
    int? dependentsCount;
    String? educationLevel;
    String? selfEmploymentType;
    String? employmentType;
    bool? isEmployee;

    CreditEvaluation({
        this.applicantId,
        this.applicantAge,
        this.applicantCategory,
        this.maritalStatus,
        this.dependentsCount,
        this.educationLevel,
        this.selfEmploymentType,
        this.employmentType,
        this.isEmployee,
    });

    factory CreditEvaluation.fromJson(Map<String, dynamic> json) => CreditEvaluation(
        applicantId: json["applicant_id"],
        applicantAge: json["applicant_age"],
        applicantCategory: json["applicant_category"],
        maritalStatus: json["marital_status"],
        dependentsCount: json["dependents_count"],
        educationLevel: json["education_level"],
        selfEmploymentType: json["self_employment_type"],
        employmentType: json["employment_type"],
        isEmployee: json["is_employee"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "applicant_age": applicantAge,
        "applicant_category": applicantCategory,
        "marital_status": maritalStatus,
        "dependents_count": dependentsCount,
        "education_level": educationLevel,
        "self_employment_type": selfEmploymentType,
        "employment_type": employmentType,
        "is_employee": isEmployee,
    };
}

class Spouse {
    int? applicantId;
    String? name;
    String? ktpNumber;
    String? placeOfBirth;
    DateTime? dateOfBirth;
    String? occupation;
    String? motherName;
    String? address;

    Spouse({
        this.applicantId,
        this.name,
        this.ktpNumber,
        this.placeOfBirth,
        this.dateOfBirth,
        this.occupation,
        this.motherName,
        this.address,
    });

    factory Spouse.fromJson(Map<String, dynamic> json) => Spouse(
        applicantId: json["applicant_id"],
        name: json["name"],
        ktpNumber: json["ktp_number"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        occupation: json["occupation"],
        motherName: json["mother_name"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "applicant_id": applicantId,
        "name": name,
        "ktp_number": ktpNumber,
        "place_of_birth": placeOfBirth,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "occupation": occupation,
        "mother_name": motherName,
        "address": address,
    };
}
