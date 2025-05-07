import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sipk/app/services/scoring_service.dart';

class FinancingProposalController extends GetxController {
  final ScoringService scoringService = ScoringService();
  final isLoading = false.obs;
  final isFromSubmissionPage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final String applicantId = Get.parameters['id'] ?? 'No message received';
  }

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();
    final logo = await imageFromAssetBundle('assets/images/logo.png');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(width: 20),
              pw.Image(logo, height: 60),
              pw.SizedBox(width: 70),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 12),
                  pw.Text('PROPOSAL PEMBIAYAAN',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold)),
                  pw.Text('KSPP SYARIAH TADBIIRUL UMMAH',
                      style: const pw.TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          pw.Divider(),
          pw.SizedBox(height: 10),
          _buildTwoColumn([
            {'Cabang Layanan': 'Ciluar'},
            {'Tanggal': '1/0/1900'},
            {'Status Anggota': 'Anggota Baru'},
            {'Jumlah Pengajuan': 'Rp2.000.000'},
            {'Jangka Waktu Pembiayaan': '1 bulan'},
            {'Tujuan Pembiayaan': 'Investasi Usaha Tanah'},
            {'Ekv. Rate': '0.7%'},
            {'Account Officer Pengusul': 'Rohmad'},
          ]),
          pw.SizedBox(height: 10),
          _buildSectionHeader('DATA ANGGOTA'),
          _buildTwoColumn([
            {'Nama Anggota': 'Darius'},
            {'Pekerjaan Pemohon': 'Pegawai Pemerintah P3K'},
            {'Tempat/Tgl. Lahir': 'Bogor, 4/6/2002'},
            {'Jenis Kelamin': 'Laki-laki'},
            {'Usia': '102 tahun'},
            {'Status Pernikahan': 'Cerai'},
            {'No. KTP': '28238'},
            {'Nama Usaha/Perusahaan': 'Cerai'},
            {'Lama Usaha': '> 1 s.d. 5 Tahun'},
            {'Saldo Rekening': 'TBU'},
            {'Pendidikan': 'D3'},
            {'Alamat Rumah': 'Bogor'},
            {'Nama Pasangan': 'Tani'},
            {'Nama Ibu Kandung': 'Imi'},
            {'No. KTP Pasangan': '83242935'},
            {'No. Telp Rumah/Hp': 'Imi'},
          ]),
          pw.SizedBox(height: 10),
          _buildSectionHeader('ANALISA KEUANGAN'),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildSmallTable('1. Data Keuangan', [
                ['Pendapatan Bersih (dari Gaji) Pemohon', '300.000.000'],
                ['Pendapatan Bersih (dari Gaji) Pasangan', '300.000.000'],
                ['Pendapatan Bersih (dari Usaha) Pemohon', '300.000.000'],
                ['Pendapatan Bersih (dari Usaha) Pasangan', '300.000.000'],
                ['Biaya Rumah Tangga', '300.000.000'],
                ['Biaya Transportasi', '300.000.000'],
                ['Biaya Komunikasi', '300.000.000'],
                ['Biaya Pendidikan', '300.000.000'],
                ['Tagihan Listrik, Air, dll', '300.000.000'],
                ['Jumlah Angsuran Berjalan', '300.000.000'],
                ['Biaya Hiburan dan Sosial', '300.000.000'],
                ['Total Pengeluaran', '300.000.000'],
                ['Penghasilan Bersih', '300.000.000'],
              ]),
              pw.SizedBox(width: 10),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildSmallTable('2. Informasi Repayment Capacity', [
                      ['RPC - Penghasilan Total', '3.000.000'],
                      ['RPC - Power Saving', '65.700.000'],
                    ]),
                    pw.SizedBox(height: 10),
                    _buildSmallTable('3. Rekomendasi Jumlah Pembiayaan', [
                      ['Angsuran Maksimum yang Dapat Dibayar', 'Doubtful'],
                      ['Jumlah Pembiayaan Maksimum', 'Tidak Memadai'],
                    ]),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(width: 10),
          _buildSectionHeader(
              'PERTIMBANGAN PEMBERIAN FASILITAS PEMBIAYAAN DIBERIKAN'),
          // di sini text aja center (contoh: skor analisa kelayakan pengajuan : 43 dengan Rating Doublful.)
          pw.SizedBox(width: 10),
          _buildSectionHeader('CATATAN MANAJER'),
          // di sini juga text
        ],
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildSectionHeader(String title) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      color: PdfColors.blueGrey200,
      child: pw.Text(title,
          style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
    );
  }

  pw.Widget _buildTwoColumn(List<Map<String, String>> data) {
    final List<pw.Widget> rows = [];

    for (var i = 0; i < data.length; i += 2) {
      final left = data[i];
      final right = (i + 1 < data.length) ? data[i + 1] : {'': ''};

      final leftKey = left.keys.first;
      final leftValue = left.values.first;

      final rightKey = right.keys.first;
      final rightValue = right.values.first;

      rows.add(
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              width: 120,
              child: pw.Text(leftKey, style: const pw.TextStyle(fontSize: 9)),
            ),
            pw.Text(':', style: const pw.TextStyle(fontSize: 9)),
            pw.SizedBox(width: 5),
            pw.SizedBox(
              width: 90,
              child: pw.Text(leftValue, style: const pw.TextStyle(fontSize: 9)),
            ),
            pw.SizedBox(width: 30),
            pw.SizedBox(
              width: 110,
              child: pw.Text(rightKey, style: const pw.TextStyle(fontSize: 9)),
            ),
            pw.Text(':', style: const pw.TextStyle(fontSize: 9)),
            pw.SizedBox(width: 5),
            pw.Expanded(
              child:
                  pw.Text(rightValue, style: const pw.TextStyle(fontSize: 9)),
            ),
          ],
        ),
      );
    }

    return pw.Column(children: rows);
  }

  pw.Widget _buildSmallTable(String title, List<List<String>> data,
      {double width = 250}) {
    return pw.Container(
      width: width,
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: pw.Text(
              title,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9),
            ),
          ),
          pw.SizedBox(height: 4),
          pw.TableHelper.fromTextArray(
            headers: ['Keterangan', 'Nilai'],
            data: data,
            cellAlignment: pw.Alignment.centerLeft,
            headerStyle:
                pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 8),
            border: pw.TableBorder.all(width: 0.5),
            textStyleBuilder: (index, data, rowNum) =>
                const pw.TextStyle(fontSize: 8),
            cellPadding: const pw.EdgeInsets.all(3),
          ),
        ],
      ),
    );
  }
}
