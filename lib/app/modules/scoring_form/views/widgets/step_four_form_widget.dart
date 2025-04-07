// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/month_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';
import 'package:sipk/app/widgets/years_input_field_widget.dart';

class StepFourFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepFourFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isOwnBusiness) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Terkait Usaha',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Laporan Usaha',
              hintText: 'Pilih jenis laporan usaha...',
              items: const [
                'Tidak Ada',
                'Catatan Jual Beli',
                'LK Inhouse Unaudited',
                'LK Audited',
              ],
              value: [
                'Tidak Ada',
                'Catatan Jual Beli',
                'LK Inhouse Unaudited',
                'LK Audited'
              ].contains(controller.businessReport.value)
                  ? controller.businessReport.value
                  : null,
              onChanged: (value) {
                controller.businessReport.value = value!;
              },
            ),
            const SizedBox(height: 16),
            MonthInputFieldWidget(
              controller: controller.employmentBusinessDurationController,
              fieldTitle: 'Lama Usaha yang Sama',
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Cara Penerimaan Pembayaran',
              hintText: 'Pilih cara penerimaan pembayaran...',
              items: const [
                'Tunai Tagihan Bon 1 sd 3',
                'Piutang > 30 Hari',
                'Piutang < 30 Hari',
                'Konsinyasi',
                'Tunai Tanpa Bon',
              ],
              value: [
                'Tunai Tagihan Bon 1 sd 3',
                'Piutang > 30 Hari',
                'Piutang < 30 Hari',
                'Konsinyasi',
                'Tunai Tanpa Bon'
              ].contains(controller.paymentReceiptMethod.value)
                  ? controller.paymentReceiptMethod.value
                  : null,
              onChanged: (value) {
                controller.paymentReceiptMethod.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Status Tempat Usaha',
              hintText: 'Pilih status tempat usaha...',
              items: const [
                'Pinjam Pakai',
                'Sewa',
                'Angsuran',
                'Milik Sendiri',
              ],
              value: ['Pinjam Pakai', 'Sewa', 'Angsuran', 'Milik Sendiri']
                      .contains(controller.businessPremisesStatus.value)
                  ? controller.businessPremisesStatus.value
                  : null,
              onChanged: (value) {
                controller.businessPremisesStatus.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Metode Menjual/Menjajakan',
              hintText: 'Pilih metode menjual/menjajakan...',
              items: const [
                'Dijajakan Keliling',
                'Mangkal Kaki Lima',
                'Menetap Sewa',
                'Menetap Milik Sendiri',
              ],
              value: [
                'Dijajakan Keliling',
                'Mangkal Kaki Lima',
                'Menetap Sewa',
                'Menetap Milik Sendiri'
              ].contains(controller.salesMethod.value)
                  ? controller.salesMethod.value
                  : null,
              onChanged: (value) {
                controller.salesMethod.value = value!;
              },
            ),
            const SizedBox(height: 16),
            TextFormFieldWidget(
              controller: controller.employeeCountController,
              fieldTitle: 'Jumlah Tenaga Kerja',
              validator: FormValidators.validateNumber,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Administrasi Usaha',
              hintText: 'Pilih administrasi usaha...',
              items: const [
                'Tidak Ada',
                'Sederhana - Usaha dan Keluarga Bercampur',
                'Sederhana - Usaha dan Keluarga Dipisah',
                'Ada - Teradministrasi Sesuai Standar',
              ],
              value: [
                'Tidak Ada',
                'Sederhana - Usaha dan Keluarga Bercampur',
                'Sederhana - Usaha dan Keluarga Dipisah',
                'Ada - Teradministrasi Sesuai Standar'
              ].contains(controller.businessAdministration.value)
                  ? controller.businessAdministration.value
                  : null,
              onChanged: (value) {
                controller.businessAdministration.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Kewajiban Usaha',
              hintText: 'Pilih kewajiban usaha...',
              items: const [
                '> Pengajuan',
                '50% > 100% Pengajuan',
                '25% > 50% Pengajuan',
                '5% > 25% Pengajuan',
                'Tidak Ada atau < 5% Pengajuan',
              ],
              value: [
                '> Pengajuan',
                '50% > 100% Pengajuan',
                '25% > 50% Pengajuan',
                '5% > 25% Pengajuan',
                'Tidak Ada atau < 5% Pengajuan'
              ].contains(controller.businessLiabilities.value)
                  ? controller.businessLiabilities.value
                  : null,
              onChanged: (value) {
                controller.businessLiabilities.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Mutasi Rekening Usaha',
              hintText: 'Pilih status rekening usaha...',
              items: const [
                'Ada',
                'Tidak Ada',
              ],
              value: ['Ada', 'Tidak Ada']
                      .contains(controller.accountStatement.value)
                  ? controller.accountStatement.value
                  : null,
              onChanged: (value) {
                controller.accountStatement.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Reputasi di Tempat Usaha',
              hintText: 'Pilih reputasi...',
              items: const [
                'Baik',
                'Tidak Baik',
                'Tidak Dikenal',
              ],
              value: ['Baik', 'Tidak Baik', 'Tidak Dikenal']
                      .contains(controller.workplaceReputation.value)
                  ? controller.workplaceReputation.value
                  : null,
              onChanged: (value) {
                controller.workplaceReputation.value = value!;
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Terkait Pekerjaan',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Status Bekerja Pemohon',
              hintText: 'Pilih status bekerja...',
              items: const [
                'Freelance',
                'Part Time',
                'Honorer',
                'Kontrak (PKWT)',
                'Tetap (PKWTT)',
              ],
              value: [
                'Freelance',
                'Part Time',
                'Honorer',
                'Kontrak (PKWT)',
                'Tetap (PKWTT)'
              ].contains(controller.employmentStatus.value)
                  ? controller.employmentStatus.value
                  : null,
              onChanged: (value) {
                controller.employmentStatus.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Bonafiditas Perusahaan',
              hintText: 'Pilih bonafiditas perusahaan...',
              items: const [
                'Bonafid',
                'Cukup Bonafid',
                'Tidak Bonafid',
              ],
              value: ['Bonafid', 'Cukup Bonafid', 'Tidak Bonafid']
                      .contains(controller.employerCredibility.value)
                  ? controller.employerCredibility.value
                  : null,
              onChanged: (value) {
                controller.employerCredibility.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Slip Gaji',
              hintText: 'Pilih status slip gaji...',
              items: const [
                'Ada',
                'Tidak Ada',
              ],
              value: ['Ada', 'Tidak Ada'].contains(controller.salarySlip.value)
                  ? controller.salarySlip.value
                  : null,
              onChanged: (value) {
                controller.salarySlip.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Mutasi Rekening Gaji',
              hintText: 'Pilih status rekening gaji...',
              items: const [
                'Ada',
                'Tidak Ada',
              ],
              value: ['Ada', 'Tidak Ada']
                      .contains(controller.accountStatement.value)
                  ? controller.accountStatement.value
                  : null,
              onChanged: (value) {
                controller.accountStatement.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Reputasi di Tempat Bekerja',
              hintText: 'Pilih reputasi...',
              items: const [
                'Baik',
                'Tidak Baik',
                'Tidak Dikenal',
              ],
              value: ['Baik', 'Tidak Baik', 'Tidak Dikenal']
                      .contains(controller.workplaceReputation.value)
                  ? controller.workplaceReputation.value
                  : null,
              onChanged: (value) {
                controller.workplaceReputation.value = value!;
              },
            ),
            const SizedBox(height: 16),
            YearsInputFieldWidget(
              controller: controller.employmentBusinessDurationController,
              fieldTitle: 'Lama Bekerja',
            ),
            const SizedBox(height: 16),
          ],
        );
      }
    });
  }
}
