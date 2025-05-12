import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sipk/app/services/submission_service.dart';
import 'package:sipk/models/financing_proposal_model.dart';

class FinancingProposalController extends GetxController {
  final SubmissionService submissionService = SubmissionService();
  final applicantId = ''.obs;
  final applicationId = ''.obs;
  Rxn<FinancingProposalModel> financingProposalData =
      Rxn<FinancingProposalModel>();
  final isLoading = false.obs;
  final isFromSubmissionPage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    applicantId.value = Get.parameters['applicant_id'] ?? '';
    applicationId.value = Get.parameters['application_id'] ?? '';
  }

  Future<void> fetchFinancingProposal() async {
    try {
      isLoading(true);
      final response = await submissionService.fetchFinancingProposal(
          applicantId.value, applicationId.value);
      financingProposalData.value = FinancingProposalModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();
    final logo = await imageFromAssetBundle('assets/images/logo.png');
    await fetchFinancingProposal();
    final result = calculateMaxInstallmentAndFinancing();

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
            {
              'Cabang Layanan': financingProposalData
                      .value?.financingApplication?.officeBranch ??
                  ""
            },
            {
              'Tanggal': formatDate(
                  financingProposalData.value?.financingApplication?.createdAt)
            },
            {
              'Status Anggota': financingProposalData
                      .value?.financingApplication?.memberStatus ??
                  ""
            },
            {
              'Jumlah Pengajuan': formatCurrency(financingProposalData
                  .value?.financingApplication?.applicationAmount)
            },
            {
              'Jangka Waktu Pembiayaan':
                  '${financingProposalData.value?.creditEvaluation?.financingTerm} bulan'
            },
            {
              'Tujuan Pembiayaan': financingProposalData
                      .value?.financingApplication?.allocation ??
                  ""
            },
            {
              'Ekv. Rate':
                  '${financingProposalData.value?.financialData?.ekvRate.toString() ?? "-"}%'
            },
            {
              'Account Officer Pengusul':
                  financingProposalData.value?.accountOfficer?.fullName ?? ""
            },
          ]),
          pw.SizedBox(height: 10),
          _buildSectionHeader('DATA ANGGOTA'),
          _buildTwoColumn([
            {
              'Nama Anggota': financingProposalData.value?.applicant?.name ?? ""
            },
            {
              'Pekerjaan Pemohon': financingProposalData
                      .value?.creditEvaluation?.employmentType ??
                  financingProposalData
                      .value?.creditEvaluation?.selfEmploymentType ??
                  ""
            },
            {
              'Tempat/Tgl. Lahir':
                  '${financingProposalData.value?.applicant?.regency ?? ""}, ${formatDate(financingProposalData.value?.applicant?.dateOfBirth)}'
            },
            {
              'Jenis Kelamin':
                  financingProposalData.value?.applicant?.gender ?? ""
            },
            {
              'Usia': financingProposalData
                      .value?.creditEvaluation?.applicantAge
                      .toString() ??
                  ""
            },
            {
              'Status Pernikahan': financingProposalData
                      .value?.creditEvaluation?.maritalStatus ??
                  ""
            },
            {
              'No. KTP': financingProposalData.value?.applicant?.ktpNumber
                      .toString() ??
                  ""
            },
            {
              'Nama Usaha/Perusahaan':
                  financingProposalData.value?.applicant?.companyName ?? ""
            },
            {
              'Lama Usaha': financingProposalData
                      .value?.creditEvaluation?.employmentBusinessDuration
                      .toString() ??
                  ""
            },
            {
              'Pendidikan': financingProposalData
                      .value?.creditEvaluation?.educationLevel ??
                  ""
            },
            {
              'Alamat Rumah':
                  financingProposalData.value?.applicant?.residentialAddress ??
                      ""
            },
            {
              'Nama Ibu Kandung':
                  financingProposalData.value?.applicant?.motherName ?? ""
            },
            {'Nama Pasangan': financingProposalData.value?.spouse?.name ?? ""},
            {
              'Pekerjaan Pasangan':
                  financingProposalData.value?.spouse?.occupation ?? ""
            },
            {
              'No. KTP Pasangan':
                  financingProposalData.value?.spouse?.ktpNumber ?? ""
            },
            {
              'No. Telp Rumah/Hp':
                  financingProposalData.value?.applicant?.homePhone ?? ""
            },
          ]),
          pw.SizedBox(height: 10),
          _buildSectionHeader('ANALISA KEUANGAN'),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildSmallTable('1. Data Keuangan', [
                [
                  'Pendapatan Bersih (dari Gaji) Pemohon',
                  formatCurrency(financingProposalData
                      .value?.financialData?.netSalaryApplicant)
                ],
                [
                  'Pendapatan Bersih (dari Gaji) Pasangan',
                  formatCurrency(financingProposalData
                      .value?.financialData?.netSalarySpouse)
                ],
                [
                  'Pendapatan Bersih (dari Usaha) Pemohon',
                  formatCurrency(financingProposalData
                      .value?.financialData?.netBusinessIncomeApplicant)
                ],
                [
                  'Pendapatan Bersih (dari Usaha) Pasangan',
                  formatCurrency(financingProposalData
                      .value?.financialData?.netBusinessIncomeSpouse)
                ],
                [
                  'Biaya Rumah Tangga',
                  formatCurrency(financingProposalData
                      .value?.financialData?.householdExpense)
                ],
                [
                  'Biaya Transportasi',
                  formatCurrency(financingProposalData
                      .value?.financialData?.transportationExpense)
                ],
                [
                  'Biaya Komunikasi',
                  formatCurrency(financingProposalData
                      .value?.financialData?.communicationExpense)
                ],
                [
                  'Biaya Pendidikan',
                  formatCurrency(financingProposalData
                      .value?.financialData?.educationExpense)
                ],
                [
                  'Tagihan Listrik, Air, dll',
                  formatCurrency(
                      financingProposalData.value?.financialData?.utilityBills)
                ],
                [
                  'Jumlah Angsuran Berjalan',
                  formatCurrency(financingProposalData
                      .value?.financialData?.ongoingInstallment)
                ],
                [
                  'Biaya Hiburan dan Sosial',
                  formatCurrency(financingProposalData
                      .value?.financialData?.entertainmentSocialExpense)
                ],
                ['Total Pengeluaran', formatCurrency(calculateTotalExpense())],
                ['Penghasilan Bersih', formatCurrency(calculateNetIncome())],
              ]),
              pw.SizedBox(width: 10),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    _buildSmallTable('2. Informasi Repayment Capacity', [
                      [
                        'RPC - Penghasilan Total',
                        formatPercentage(financingProposalData
                            .value?.creditEvaluation?.totalIncomeRatio)
                      ],
                      [
                        'RPC - Power Saving',
                        formatPercentage(financingProposalData
                            .value?.creditEvaluation?.powerSavingRatio)
                      ],
                    ]),
                    pw.SizedBox(height: 10),
                    _buildSmallTable('3. Rekomendasi Jumlah Pembiayaan', [
                      [
                        'Angsuran Maksimum yang Dapat Dibayar',
                        (formatCurrency(result['maxInstallment']!))
                      ],
                      [
                        'Jumlah Pembiayaan Maksimum',
                        (formatCurrency(result['maxFinancing']!))
                      ],
                    ]),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(width: 10),
          _buildSectionHeader(
              'PERTIMBANGAN PEMBERIAN FASILITAS PEMBIAYAAN DIBERIKAN'),
          pw.Text(
            textAlign: pw.TextAlign.justify,
            generateCreditScoreNarrative(
                financingProposalData.value?.creditScore?.totalScore),
            style: const pw.TextStyle(
              fontSize: 10,
            ),
          ),
          pw.SizedBox(width: 10),
          _buildSectionHeader('CATATAN MANAJER'),
          pw.Text(
            textAlign: pw.TextAlign.justify,
            financingProposalData.value?.financingApplication?.remarks ?? "",
            style: const pw.TextStyle(
              fontSize: 10,
            ),
          )
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

  String formatCurrency(num? number) {
    if (number == null) return '';
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(number);
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  num calculateTotalExpense() {
    final data = financingProposalData.value?.financialData;
    if (data == null) return 0;

    return (data.householdExpense ?? 0) +
        (data.transportationExpense ?? 0) +
        (data.communicationExpense ?? 0) +
        (data.educationExpense ?? 0) +
        (data.utilityBills ?? 0) +
        (data.ongoingInstallment ?? 0) +
        (data.entertainmentSocialExpense ?? 0);
  }

  num calculateNetIncome() {
    final data = financingProposalData.value?.financialData;
    if (data == null) return 0;

    final totalIncome = (data.netSalaryApplicant ?? 0) +
        (data.netSalarySpouse ?? 0) +
        (data.netBusinessIncomeApplicant ?? 0) +
        (data.netBusinessIncomeSpouse ?? 0);

    return totalIncome - calculateTotalExpense();
  }

  Map<String, num> calculateMaxInstallmentAndFinancing({int tenor = 12}) {
    final data = financingProposalData.value?.financialData;
    if (data == null) return {'maxInstallment': 0, 'maxFinancing': 0};

    final sisaPenghasilan = calculateNetIncome();
    final maksimalAngsuran = sisaPenghasilan * 0.5;

    final ekvRate = (data.ekvRate ?? 0) / 100;
    final tipeAngsuran = (data.installmentType ?? 'flat').toLowerCase();

    num jumlahPembiayaan;

    if (tipeAngsuran == 'flat') {
      jumlahPembiayaan = maksimalAngsuran / (1 / tenor + ekvRate);
    } else if (tipeAngsuran == 'anuitas') {
      final r = ekvRate;
      jumlahPembiayaan = maksimalAngsuran /
          ((r * pow(1 + r, tenor)) / (pow(1 + r, tenor) - 1));
    } else {
      jumlahPembiayaan = maksimalAngsuran * tenor;
    }

    return {
      'maxInstallment': maksimalAngsuran,
      'maxFinancing': jumlahPembiayaan.round(),
    };
  }

  String formatPercentage(double? value) {
    if (value == null) return '-';
    return '${(value * 100).toStringAsFixed(2)}%';
  }

  String generateCreditScoreNarrative(num? score) {
    if (score == null) return 'Skor analisa kelayakan belum tersedia.';

    final ratingInfo = _getRatingInfo(score);
    if (ratingInfo.isEmpty) {
      return 'Data rating tidak ditemukan untuk skor $score.';
    }

    return 'Skor analisa kelayakan pengajuan: $score dengan Rating ${ratingInfo['rank']} '
        '(${ratingInfo['rating']} - ${ratingInfo['category']}). '
        '${ratingInfo['explanation']}';
  }

  Map<String, String> _getRatingInfo(num? score) {
    if (score == null) return {};

    final num numericScore = score;

    if (numericScore >= 98) {
      return {
        'rank': 'AAA',
        'rating': 'Outstanding',
        'category': 'Sangat Baik',
        'explanation':
            'Ini adalah rating tertinggi dan terbaik yang diberikan kepada debitur. Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjaman bank dipandang tidak diragukan.'
      };
    } else if (numericScore >= 95) {
      return {
        'rank': 'AA+',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA+" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 92) {
      return {
        'rank': 'AA',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 89) {
      return {
        'rank': 'AA-',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA-" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 86) {
      return {
        'rank': 'A+',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A+" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 83) {
      return {
        'rank': 'A',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 80) {
      return {
        'rank': 'A-',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A-" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 77) {
      return {
        'rank': 'BBB+',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB+" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 74) {
      return {
        'rank': 'BBB',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 71) {
      return {
        'rank': 'BBB-',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB-" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 68) {
      return {
        'rank': 'BB+',
        'rating': 'Acceptable',
        'category': 'Kurang',
        'explanation':
            'Debitur yang diberikan rating "BB+" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 65) {
      return {
        'rank': 'BB',
        'rating': 'Acceptable',
        'category': 'Kurang',
        'explanation':
            'Debitur yang diberikan rating "BB" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 62) {
      return {
        'rank': 'BB-',
        'rating': 'High Risk',
        'category': 'Risiko Tinggi',
        'explanation':
            'Debitur yang diberikan rating "BB-" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 59) {
      return {
        'rank': 'B+',
        'rating': 'High Risk',
        'category': 'Risiko Tinggi',
        'explanation':
            'Debitur yang diberikan rating "B+" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 56) {
      return {
        'rank': 'B',
        'rating': 'Watch List',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "B" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 53) {
      return {
        'rank': 'B-',
        'rating': 'Watch List',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "B-" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 50) {
      return {
        'rank': 'CCC+',
        'rating': 'Special Mention',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "CCC+" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else if (numericScore >= 47) {
      return {
        'rank': 'CCC',
        'rating': 'Special Mention',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "CCC" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else if (numericScore >= 44) {
      return {
        'rank': 'CCC-',
        'rating': 'Substandard',
        'category': 'Tidak Sehat',
        'explanation':
            'Debitur yang diberikan rating "CCC-" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else {
      return {
        'rank': 'D',
        'rating': 'Doubtful',
        'category': 'Diragukan',
        'explanation':
            'Tidak prospektif. Rating ini diberikan kepada debitur yang diperkirakan akan menjadi kredit macet.'
      };
    }
  }
}
