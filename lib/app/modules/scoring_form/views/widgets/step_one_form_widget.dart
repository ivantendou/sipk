import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/date_input_field_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

class StepOneFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepOneFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? parseDate(String? dateString) {
      if (dateString == null || dateString.isEmpty) {
        return null;
      }
      try {
        return DateTime.parse(dateString);
      } catch (e) {
        return null;
      }
    }

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Applicant Personal Information',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.applicantNameController,
            fieldTitle: 'Applicant Name',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Applicant Category',
            hintText: 'Select applicant category...',
            value: [
              'Walk-In Customer',
              'Solisitasi',
              'Referensi dari Anggota',
              'Anggota < dari 1 Tahun',
              'Anggota > dari 1 Tahun'
            ].contains(controller.applicantCategory.value)
                ? controller.applicantCategory.value
                : null,
            items: const [
              'Walk-In Customer',
              'Solisitasi',
              'Referensi dari Anggota',
              'Anggota < dari 1 Tahun',
              'Anggota > dari 1 Tahun',
            ],
            onChanged: (value) {
              controller.applicantCategory.value = value!;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.ktpAddressController,
            fieldTitle: 'KTP Address',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.residentialAddressController,
            fieldTitle: 'Residential Address',
            keyboardType: TextInputType.text,
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.regencyController,
            fieldTitle: 'Regency/City',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.provinceController,
            fieldTitle: 'Province',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.postalCodeController,
            fieldTitle: 'Postal Code',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.placeOfBirthController,
            fieldTitle: 'Place of Birth',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          DateInputFieldWidget(
            controller: controller,
            hintText: "Select date of birth...",
            fieldTitle: 'Date of Birth',
            initialValue: parseDate(controller.dateOfBirth.value),
            onChanged: (value) {
              controller.dateOfBirth.value = value;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.ktpNumberController,
            fieldTitle: 'KTP Number',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.motherNameController,
            fieldTitle: "Applicant's Mother Name",
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.homePhoneController,
            fieldTitle: 'Home Phone',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.mobilePhoneController,
            fieldTitle: 'Phone Number',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Gender',
            hintText: 'Select gender...',
            items: const [
              'Laki-laki',
              'Perempuan',
              'Lembaga',
            ],
            value: ['Laki-laki', 'Perempuan', 'Lembaga']
                    .contains(controller.gender.value)
                ? controller.gender.value
                : null,
            onChanged: (value) {
              controller.gender.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Education Level',
            hintText: 'Select education level...',
            items: const [
              'SD',
              'SMP',
              'SMA',
              'D3/S1-S3',
            ],
            value: ['SD', 'SMP', 'SMA', 'D3/S1-S3']
                    .contains(controller.educationLevel.value)
                ? controller.educationLevel.value
                : null,
            onChanged: (value) {
              controller.educationLevel.value = value!;
            },
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Occupation',
            hintText: 'Select occupation...',
            items: const [
              'Buruh Harian',
              'Pedagang',
              'Wiraswasta',
              'Profesional',
              'Guru/Pengajar',
              'Karyawan Swasta',
              'Karyawan BUMN/BUMD',
              'Pegawai Pemerintah P3K',
              'ASN (Pegawai Negeri)'
            ],
            value: controller.selfEmploymentType.value ??
                controller.employmentType.value,
            onChanged: (value) {
              controller.selectedOccupation.value = value!;
              if (controller.isOwnBusiness) {
                controller.selfEmploymentType.value = value;
                controller.employmentType.value = null;
                controller.hasBusiness.value = 'Ya';
              } else {
                controller.employmentType.value = value;
                controller.selfEmploymentType.value = null;
                controller.hasBusiness.value = 'Tidak';
              }
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.companyNameController,
            fieldTitle: 'Company Name',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.companyAddressController,
            fieldTitle: 'Company Address',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.bossNameController,
            fieldTitle: 'Supervisor Name',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Marital Status',
            hintText: 'Pilih status perkawinan...',
            items: const [
              'Belum Menikah',
              'Menikah',
              'Cerai',
            ],
            value: controller.maritalStatus.value,
            onChanged: (value) {
              controller.maritalStatus.value = value!;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseNameController,
            fieldTitle: 'Spouse/Guardian Name',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseMotherNameController,
            fieldTitle: "Spouse/Guardian's Mother Name",
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseAddressController,
            fieldTitle: 'Spouse/Guardian Address',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseKtpNumberController,
            fieldTitle: 'Spouse/Guardian KTP Number',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spousePlaceOfBirthController,
            fieldTitle: "Spouse/Guardian's Place of Birth",
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          DateInputFieldWidget(
            controller: controller,
            hintText: "Select date of brith...",
            fieldTitle: "Spouse/Guardian's Date of Birth",
            initialValue: parseDate(controller.spouseDateOfBirth.value),
            onChanged: (value) {
              controller.spouseDateOfBirth.value = value;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseOccupationController,
            fieldTitle: "Spouse/Guardian's Occupation",
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.dependentsCountController,
            fieldTitle: "Number of Dependents",
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
