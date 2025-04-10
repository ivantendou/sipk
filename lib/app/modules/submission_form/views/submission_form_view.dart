import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/utils/form_validators.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/dropdown_input_field_widget.dart';
import 'package:sipk/app/widgets/rupiah_input_field_widget.dart';
import 'package:sipk/app/widgets/text_form_field_widget.dart';

import '../controllers/submission_form_controller.dart';

class SubmissionFormView extends GetView<SubmissionFormController> {
  const SubmissionFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0);
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Formulir Pengajuan'),
      backgroundColor: ColorsConstant.grey100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Skoring Pemohon',
                    style: TextStyleConstant.body,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.AO_SELECT_SCORING);
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorsConstant.white,
                        border: Border.all(
                          color: ColorsConstant.grey500,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(
                        () {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: controller.applicantId.value == ''
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pilih Data Skoring Pemohon',
                                        style: TextStyleConstant.body.copyWith(
                                          color: ColorsConstant.grey700,
                                        ),
                                      ),
                                      Assets.images.arrowRight.svg(
                                        colorFilter: const ColorFilter.mode(
                                          ColorsConstant.grey700,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${controller.applicantId.value}. ${controller.name.value} - ${controller.ktpNumber.value}",
                                          style:
                                              TextStyleConstant.body.copyWith(
                                            color: ColorsConstant.grey700,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownInputFieldWidget(
                    fieldTitle: 'Cabang Layanan',
                    hintText: 'Pilih cabang layanan',
                    items: const [
                      'Ciluar',
                      'Dramaga',
                    ],
                    onChanged: (value) {
                      controller.officeBranch.value = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownInputFieldWidget(
                    fieldTitle: 'Status Anggota',
                    hintText: 'Pilih status anggota',
                    items: const [
                      'Anggota Baru',
                      'Anggota Lama',
                    ],
                    onChanged: (value) {
                      controller.memberStatus.value = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormFieldWidget(
                    controller: controller.allocation,
                    fieldTitle: 'Tujuan Pembiayaan',
                    validator: FormValidators.validateRequired,
                  ),
                  const SizedBox(height: 16),
                  RupiahInputFieldWidget(
                    controller: controller.applicationAmount,
                    fieldTitle: 'Jumlah Pembiayaan',
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return controller.maxFinancing.value == 0 &&
                            controller.maxInstallment.value == 0
                        ? const SizedBox()
                        : Text(
                            'Rekomendasi Jumlah Pembiayaan:',
                            style: TextStyleConstant.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                  }),
                  Obx(() {
                    final maxInstallment = controller.maxInstallment.value;
                    final maxFinancing = controller.maxFinancing.value;

                    if (maxFinancing == 0 && maxInstallment == 0) {
                      return const SizedBox();
                    }

                    if (maxFinancing < 0 || maxInstallment < 0) {
                      return Text(
                        'Sisa penghasilan tidak mencukupi untuk pembiayaan.',
                        style: TextStyleConstant.body.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }

                    return RichText(
                      text: TextSpan(
                        style: TextStyleConstant.body
                            .copyWith(color: ColorsConstant.black),
                        children: [
                          const TextSpan(
                              text: 'Angsuran Maksimum yang Dapat Dibayar: '),
                          TextSpan(
                            text: 'Rp ${currencyFormat.format(maxInstallment)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                              text: ' per bulan\nJumlah Pembiayaan Maksimum: '),
                          TextSpan(
                            text: 'Rp ${currencyFormat.format(maxFinancing)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  Obx(
                    () {
                      return CustomButtonWidget(
                        text: 'Ajukan Pembiayaan',
                        width: double.infinity,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.postFinancingApplications();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
