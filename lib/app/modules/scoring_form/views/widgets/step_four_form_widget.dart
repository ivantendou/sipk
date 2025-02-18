// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_form/controllers/scoring_form_controller.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';

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
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Lama Usaha yang Sama',
              hintText: 'Pilih lama waktu usaha...',
              items: const [
                '1 Tahun',
                '> 1 s.d. 5 Tahun',
                '> 5 s.d. 10 Tahun',
                '> 10 Tahun',
              ],
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Jumlah Tenaga Kerja',
              hintText: 'Pilih jumlah tenaga kerja...',
              items: const [
                '<= 2 Orang',
                '> 2 s.d 5 Orang',
                '> 5 s.d 10 Orang',
                '> 10 Orang',
              ],
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
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
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Mutasi Rekening Gaji/Usaha',
              hintText: 'Pilih status rekening gaji/usaha...',
              items: const [
                'Ada',
                'Tidak Ada',
              ],
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Reputasi di Tempat Bekerja/Berusaha',
              hintText: 'Pilih reputasi...',
              items: const [
                'Baik',
                'Tidak Baik',
                'Tidak Dikenal',
              ],
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
            DropdownInputFieldWidget(
              fieldTitle: 'Lama Bekerja',
              hintText: 'Pilih waktu lama bekerja...',
              items: const [
                '1 Tahun',
                '> 1 s.d. 5 Tahun',
                '> 5 s.d. 10 Tahun',
                '> 10 Tahun',
              ],
              onChanged: (value) {
                controller.selectedOption.value = value!;
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      }
    });
  }
}
