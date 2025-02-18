// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';

class StepSixFormWidget extends StatelessWidget {
  final ScoringFormController controller;

  const StepSixFormWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Tempat Tinggal',
          style: TextStyleConstant.subHeading2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Kepemilikan Tempat Tanggal',
          hintText: 'Pilih jenis kepemilikan tempat tanggal...',
          items: const [
            'Sewa',
            'Milik Keluarga/Rumah Dinas',
            'Milik Sendiri (Angsuran KPR)',
            'Milik Sendiri'
          ],
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Lama Tinggal/Menetap',
          hintText: 'Pilih lama tinggal/menetap...',
          items: const [
            '0 - 2 Tahun',
            '> 2 - 5 Tahun',
            '> 5 - 8 Tahun',
            '> 8 Tahun',
          ],
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
        DropdownInputFieldWidget(
          fieldTitle: 'Reputasi di Lingkungan Tempat Tinggal',
          hintText: 'Pilih reputasi...',
          items: const [
            'Baik',
            'Tidak Baik',
            'Tidak Dikenal',
          ],
          onChanged: (value) {
            controller.selectedJob.value = value!;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
