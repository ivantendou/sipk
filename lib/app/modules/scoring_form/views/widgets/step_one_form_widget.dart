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
            'Data Pribadi Pemohon',
            style: TextStyleConstant.subHeading2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.applicantNameController,
            fieldTitle: 'Nama Pemohon',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Kategori Pemohon',
            hintText: 'Pilih kategori pemohon...',
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
            fieldTitle: 'Alamat KTP',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.residentialAddressController,
            fieldTitle: 'Alamat Domisili',
            keyboardType: TextInputType.phone,
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.regencyController,
            fieldTitle: 'Kabupaten/Kodya',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.provinceController,
            fieldTitle: 'Provinsi',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.postalCodeController,
            fieldTitle: 'Kode Pos',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.placeOfBirthController,
            fieldTitle: 'Tempat Lahir',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          DateInputFieldWidget(
            controller: controller,
            hintText: "Pilih tanggal lahir...",
            fieldTitle: 'Tanggal Lahir',
            initialValue: parseDate(controller.dateOfBirth.value),
            onChanged: (value) {
              controller.dateOfBirth.value = value;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.ktpNumberController,
            fieldTitle: 'No. KTP',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.motherNameController,
            fieldTitle: 'Nama Ibu Kandung Pemohon',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.homePhoneController,
            fieldTitle: 'Telp Rumah',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.mobilePhoneController,
            fieldTitle: 'No HP Pemohon',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Jenis Kelamin',
            hintText: 'Pilih jenis kelamin...',
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
            fieldTitle: 'Tingkat Pendidikan',
            hintText: 'Pilih tingkat pendidikan...',
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
            fieldTitle: 'Pekerjaan',
            hintText: 'Pilih pekerjaan pemohon...',
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
              } else {
                controller.employmentType.value = value;
                controller.selfEmploymentType.value = null;
              }
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.companyNameController,
            fieldTitle: 'Nama Perusahaan',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.companyAddressController,
            fieldTitle: 'Alamat Perusahaan',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.bossNameController,
            fieldTitle: 'Nama Atasan',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          DropdownInputFieldWidget(
            fieldTitle: 'Status Perkawinan',
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
            fieldTitle: 'Nama Pasangan/Wali',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseMotherNameController,
            fieldTitle: 'Nama Ibu Kandung Pasangan/Wali',
            validator: FormValidators.validateName,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseAddressController,
            fieldTitle: 'Alamat Pasangan/Wali',
            validator: FormValidators.validateAddress,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseKtpNumberController,
            fieldTitle: 'No.KTP Pasangan/Wali',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spousePlaceOfBirthController,
            fieldTitle: 'Tempat Lahir Pasangan/Wali',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          DateInputFieldWidget(
            controller: controller,
            hintText: "Pilih tanggal lahir...",
            fieldTitle: 'Tanggal Lahir Pasangan/Wali',
            initialValue: parseDate(controller.spouseDateOfBirth.value),
            onChanged: (value) {
              controller.spouseDateOfBirth.value = value;
            },
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.spouseOccupationController,
            fieldTitle: 'Pekerjaan Pasangan/Wali',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            controller: controller.dependentsCountController,
            fieldTitle: 'Jumlah Tanggungan',
            validator: FormValidators.validateNumber,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }
}
