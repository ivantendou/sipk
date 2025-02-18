// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/date_input_field_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/phone_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

class StepOneFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepOneFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          controller: controller.sampleController,
          fieldTitle: 'Nama Pemohon',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Kategori Pemohon',
          hintText: 'Pilih kategori pemohon...',
          items: const [
            'Walk-in Customer',
            'Solisitasi',
            'Referensi dari Anggota',
            'Anggota < dari 1 Tahun',
            'Anggota > dari 1 Tahun',
          ],
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Alamat KTP',
          validator: FormValidators.validateAddress,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Alamat Domisili',
          keyboardType: TextInputType.phone,
          validator: FormValidators.validateAddress,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Kabupaten/Kodya',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Provinsi',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Kode Pos',
          validator: FormValidators.validateNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Tempat Lahir',
          validator: FormValidators.validateName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        DateInputFieldWidget(
          controller: controller,
          hintText: "Pilih tanggal lahir...",
          fieldTitle: 'Tanggal Lahir',
          onChanged: (value) {
            controller.selectedDate.value = value;
          },
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'No. KTP',
          validator: FormValidators.validateNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Nama Ibu Kandung Pemohon',
          validator: FormValidators.validateName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Telp Rumah',
          validator: null,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        PhoneInputField(
          fieldTitle: 'No HP Pemohon',
          controller: controller.sampleController,
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
          onChanged: (value) {
            controller.selectedJob.value = value!;
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
          onChanged: (value) {
            controller.selectedJob.value = value!;
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
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Nama Perusahaan',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Alamat Perusahaan',
          validator: FormValidators.validateAddress,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Nama Atasan',
          validator: FormValidators.validateName,
          keyboardType: TextInputType.name,
        ),
        DropdownInputFieldWidget(
          fieldTitle: 'Status Perkawinan',
          hintText: 'Pilih status perkawinan...',
          items: const [
            'Belum Menikah',
            'Menikah'
            'Cerai',
          ],
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Nama Pasangan/Wali',
          validator: FormValidators.validateName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Nama Ibu Kandung Pasangan/Wali',
          validator: FormValidators.validateName,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Alamat Pasangan/Wali',
          validator: FormValidators.validateAddress,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'No.KTP Pasangan/Wali',
          validator: FormValidators.validateNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Tempat Lahir Pasangan/Wali',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        DateInputFieldWidget(
          controller: controller,
          hintText: "Pilih tanggal lahir...",
          fieldTitle: 'Tanggal Lahir Pasangan/Wali',
          onChanged: (value) {
            controller.selectedDate.value = value;
          },
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Pekerjaan Pasangan/Wali',
          validator: FormValidators.validateName,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Jumlah Tanggungan',
          validator: FormValidators.validateNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        TextFormFieldWidget(
          controller: controller.sampleController,
          fieldTitle: 'Jumlah Anak',
          validator: FormValidators.validateNumber,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
