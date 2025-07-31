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
              'Business-Related Data',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Business Report',
              hintText: 'Select business report type...',
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
              fieldTitle: 'Duration of Same Business',
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Method of Payment Receipt',
              hintText: 'Select method of payment receipt...',
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
              fieldTitle: 'Business Premises Status',
              hintText: 'Select business premises status...',
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
              fieldTitle: 'Selling/Vending Method',
              hintText: 'Select selling/vending method...',
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
              fieldTitle: 'Number of Employees',
              validator: FormValidators.validateNumber,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Business Administrationa',
              hintText: 'Select business administration...',
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
              fieldTitle: 'Business Liabilities',
              hintText: 'Select business liabilities...',
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
              fieldTitle: 'Business Account Statement',
              hintText: 'Select business account statement...',
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
              fieldTitle: 'Reputation at Business Place',
              hintText: 'Select reputation...',
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
              'Employment-Related Data',
              style: TextStyleConstant.subHeading2.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Applicant\'s Employment Status',
              hintText: 'Select employment status...',
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
              fieldTitle: 'Company Credibility',
              hintText: 'Select company credibility...',
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
              fieldTitle: 'Payslip',
              hintText: 'Select payslip...',
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
              fieldTitle: 'Salary Account Statement',
              hintText: 'Select salary account...',
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
              fieldTitle: 'Reputation at Workplace',
              hintText: 'Select reputation...',
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
              fieldTitle: 'Years of Employment',
            ),
            const SizedBox(height: 16),
          ],
        );
      }
    });
  }
}
