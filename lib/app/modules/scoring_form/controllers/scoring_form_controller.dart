import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/services/scoring_service.dart';

class ScoringFormController extends GetxController {
  final ScoringService scoringService = ScoringService();
  var applicantId = ''.obs;
  var currentIndex = 0.obs;
  var stepCompleted = List.generate(8, (index) => false).obs;
  final formKeys = List.generate(8, (index) => GlobalKey<FormState>());

  final TextEditingController applicantNameController = TextEditingController();
  final Rxn<String> applicantCategory = Rxn<String>();
  final TextEditingController ktpAddressController = TextEditingController();
  final TextEditingController residentialAddressController =
      TextEditingController();
  final TextEditingController regencyController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();
  final Rxn<String> dateOfBirth = Rxn<String>();
  final TextEditingController ktpNumberController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController homePhoneController = TextEditingController();
  final TextEditingController mobilePhoneController = TextEditingController();
  final Rxn<String> gender = Rxn<String>();
  final Rxn<String> educationLevel = Rxn<String>();
  Rx<String?> selectedOccupation = Rx<String?>('');
  final Rxn<String> selfEmploymentType = Rxn<String>();
  final Rxn<String> employmentType = Rxn<String>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyAddressController =
      TextEditingController();
  final TextEditingController bossNameController = TextEditingController();
  final Rxn<String> maritalStatus = Rxn<String>();
  final TextEditingController spouseNameController = TextEditingController();
  final TextEditingController spouseMotherNameController =
      TextEditingController();
  final TextEditingController spouseAddressController = TextEditingController();
  final TextEditingController spouseKtpNumberController =
      TextEditingController();
  final TextEditingController spousePlaceOfBirthController =
      TextEditingController();
  final Rxn<String> spouseDateOfBirth = Rxn<String>();
  final TextEditingController spouseOccupationController =
      TextEditingController();
  final TextEditingController dependentsCountController =
      TextEditingController();
  final TextEditingController childCountController = TextEditingController();

  final Rxn<String> financingType = Rxn<String>();
  final Rxn<String> financingIteration = Rxn<String>();
  final TextEditingController applicationAmountController =
      TextEditingController();
  final TextEditingController allocationController = TextEditingController();
  final TextEditingController downPaymentPctController =
      TextEditingController();
  final TextEditingController downPaymentAmtController =
      TextEditingController();

  final TextEditingController netSalaryApplicantController =
      TextEditingController();
  final TextEditingController netSalarySpouseController =
      TextEditingController();
  final TextEditingController netBusinessIncomeApplicantController =
      TextEditingController();
  final TextEditingController netBusinessIncomeSpouseController =
      TextEditingController();
  final TextEditingController householdExpenseController =
      TextEditingController();
  final TextEditingController transportationExpenseController =
      TextEditingController();
  final TextEditingController communicationExpenseController =
      TextEditingController();
  final TextEditingController educationExpenseController =
      TextEditingController();
  final TextEditingController utilityBillsController = TextEditingController();
  final TextEditingController ongoingInstallmentController =
      TextEditingController();
  final TextEditingController entertainmentExpenseController =
      TextEditingController();
  final TextEditingController financingTermController = TextEditingController();
  final TextEditingController ekvRateController = TextEditingController();
  final Rxn<String> installmentType = Rxn<String>();

  final Rxn<String> businessReport = Rxn<String>();
  final TextEditingController employmentBusinessDurationController =
      TextEditingController();
  final Rxn<String> paymentReceiptMethod = Rxn<String>();
  final Rxn<String> businessPremisesStatus = Rxn<String>();
  final Rxn<String> salesMethod = Rxn<String>();
  final TextEditingController employeeCountController = TextEditingController();
  final Rxn<String> businessAdministration = Rxn<String>();
  final Rxn<String> businessLiabilities = Rxn<String>();
  final Rxn<String> employmentStatus = Rxn<String>();
  final Rxn<String> employerCredibility = Rxn<String>();
  final Rxn<String> salarySlip = Rxn<String>();
  final Rxn<String> accountStatement = Rxn<String>();
  final Rxn<String> workplaceReputation = Rxn<String>();

  final TextEditingController salesController = TextEditingController();
  final TextEditingController cogsController = TextEditingController();
  final TextEditingController dailyLaborController = TextEditingController();
  final TextEditingController consumptionController = TextEditingController();
  final TextEditingController transportCostController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController packagingController = TextEditingController();
  final TextEditingController depreciationController = TextEditingController();
  final TextEditingController otherCostsController = TextEditingController();
  final TextEditingController activeDaysController = TextEditingController();
  final TextEditingController monthlyLaborController = TextEditingController();
  final TextEditingController rentalController = TextEditingController();
  final TextEditingController assetMaintenanceController =
      TextEditingController();
  final TextEditingController utilitiesController = TextEditingController();

  final Rxn<String> residenceOwnership = Rxn<String>();
  final TextEditingController residenceDurationController =
      TextEditingController();
  final Rxn<String> neighborhoodReputation = Rxn<String>();

  final Rxn<String> bankingRelationship = Rxn<String>();
  final Rxn<String> averageMonthlyBalance = Rxn<String>();
  final Rxn<String> averageTransactionFrequency = Rxn<String>();
  final Rxn<String> applicantCreditQuality = Rxn<String>();
  final Rxn<String> applicantCreditRating = Rxn<String>();
  final Rxn<String> spouseCreditRating = Rxn<String>();

  final Rxn<String> applicationCoverage = Rxn<String>();
  final Rxn<String> vehicleCollateralInsurance = Rxn<String>();
  final Rxn<String> applicantLifeInsurance = Rxn<String>();
  final Rxn<String> collateralBinding = Rxn<String>();

  Rx<String> hasBusiness = Rx<String>('Ya');
  bool get isOwnBusiness => [
        'Buruh Harian',
        'Pedagang',
        'Wiraswasta',
        'Profesional',
      ].contains(selectedOccupation.value);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) {
      applicantId.value = args['applicantId'] ?? '';
    }
  }

  void deleteForm() async {
    await scoringService.deleteForm(applicantId: applicantId.value);
    Get.back();
  }

  void updateFirstStep() async {
    int applicantAge = calculateAge(dateOfBirth.value);
    await scoringService.updateFirstStep(
      applicantId: applicantId.value,
      applicantName: applicantNameController.text,
      applicantCategory: applicantCategory.value,
      ktpAddress: ktpAddressController.text,
      residentialAddress: residentialAddressController.text,
      regency: regencyController.text,
      province: provinceController.text,
      postalCode: postalCodeController.text,
      placeOfBirth: placeOfBirthController.text,
      dateOfBirth: dateOfBirth.value,
      applicantAge: applicantAge.toString(),
      ktpNumber: ktpNumberController.text,
      motherName: motherNameController.text,
      homePhone: homePhoneController.text,
      mobilePhone: mobilePhoneController.text,
      gender: gender.value,
      educationLevel: educationLevel.value,
      selfEmploymentType: selfEmploymentType.value,
      employmentType: employmentType.value,
      companyName: companyNameController.text,
      companyAddress: companyAddressController.text,
      bossName: bossNameController.text,
      maritalStatus: maritalStatus.value,
      spouseName: spouseNameController.text,
      spouseMotherName: spouseMotherNameController.text,
      spouseAddress: spouseAddressController.text,
      spouseKtpNumber: spouseKtpNumberController.text,
      spousePlaceOfBirth: spousePlaceOfBirthController.text,
      spouseDateOfBirth: spouseDateOfBirth.value,
      spouseOccupation: spouseOccupationController.text,
      dependentsCount: dependentsCountController.text,
      childCount: childCountController.text,
      isEmployee: !isOwnBusiness,
    );
  }

  void updateSecondStep() async {
    await scoringService.updateSecondStep(
      applicantId: applicantId.value,
      allocation: allocationController.text,
      applicationAmount: applicationAmountController.text,
      downPaymentAmt: downPaymentAmtController.text,
      downPaymentPct: downPaymentPctController.text,
      financingIteration: financingIteration.value,
      financingType: financingType.value,
    );
  }

  void updateThirdStep() async {
    await scoringService.updateThirdStep(
      applicantId: applicantId.value,
      communicationExpense: communicationExpenseController.text,
      educationExpense: educationExpenseController.text,
      ekvRate: ekvRateController.text,
      entertainmentExpense: entertainmentExpenseController.text,
      financingTerm: double.tryParse(financingTermController.text)! / 12,
      householdExpense: householdExpenseController.text,
      installmentType: installmentType.value,
      netBusinessIncomeApplicant:
          netBusinessIncomeApplicantController.text.isEmpty
              ? "0"
              : netBusinessIncomeApplicantController.text,
      netBusinessIncomeSpouse: netBusinessIncomeSpouseController.text.isEmpty
          ? "0"
          : netBusinessIncomeSpouseController.text,
      netSalaryApplicant: netSalaryApplicantController.text,
      netSalarySpouse: netSalarySpouseController.text,
      ongoingInstallment: ongoingInstallmentController.text,
      transportationExpense: transportationExpenseController.text,
      utilityBills: utilityBillsController.text,
    );
  }

  void updateFourthStep() async {
    await scoringService.updateFourthStep(
      applicantId: applicantId.value,
      accountStatement: accountStatement.value,
      businessAdministration: businessAdministration.value,
      businessLiabilities: businessLiabilities.value,
      businessPremisesStatus: businessPremisesStatus.value,
      businessReport: businessReport.value,
      employeeCount: employeeCountController.text,
      employerCredibility: employerCredibility.value,
      employmentBusinessDuration:
          double.tryParse(employmentBusinessDurationController.text)! / 12,
      employmentStatus: employmentStatus.value,
      paymentReceiptMethod: paymentReceiptMethod.value,
      salarySlip: salarySlip.value,
      salesMethod: salesMethod.value,
      workplaceReputation: workplaceReputation.value,
    );
  }

  void updateFifthStep() async {
    await scoringService.updateFifthStep(
      applicantId: applicantId.value,
      activeDays: double.tryParse(activeDaysController.text) ?? 0,
      assetMaintenance: double.tryParse(assetMaintenanceController.text) ?? 0,
      cogs: double.tryParse(cogsController.text) ?? 0,
      consumption: double.tryParse(consumptionController.text) ?? 0,
      dailyLabor: double.tryParse(dailyLaborController.text) ?? 0,
      depreciation: double.tryParse(depreciationController.text) ?? 0,
      fuel: double.tryParse(fuelController.text) ?? 0,
      monthlyLabor: double.tryParse(monthlyLaborController.text) ?? 0,
      otherCosts: double.tryParse(otherCostsController.text) ?? 0,
      packaging: double.tryParse(packagingController.text) ?? 0,
      rental: double.tryParse(rentalController.text) ?? 0,
      sales: double.tryParse(salesController.text) ?? 0,
      transportCost: double.tryParse(transportCostController.text) ?? 0,
      utilities: double.tryParse(utilitiesController.text) ?? 0,
    );
  }

  void updateSixStep() async {
    await scoringService.updateSixStep(
      applicantId: applicantId.value,
      neighborhoodReputation: neighborhoodReputation.value,
      residenceDuration: residenceDurationController.text,
      residenceOwnership: residenceOwnership.value,
    );
  }

  void updateSevenStep() async {
    await scoringService.updateSevenStep(
      applicantId: applicantId.value,
      applicantCreditQuality: applicantCreditQuality.value,
      applicantCreditRating: applicantCreditRating.value,
      averageMonthlyBalance: averageMonthlyBalance.value,
      averageTransactionFrequency: averageTransactionFrequency.value,
      bankingRelationship: bankingRelationship.value,
      spouseCreditRating: spouseCreditRating.value,
    );
  }

  void updateEightStep() async {
    try {
      await scoringService.updateEightStep(
        applicantId: applicantId.value,
        applicantLifeInsurance: applicantLifeInsurance.value,
        applicationCoverage: applicationCoverage.value,
        collateralBinding: collateralBinding.value,
        vehicleCollateralInsurance: vehicleCollateralInsurance.value,
      );
      showScoreCalculatedDialog();
    } catch (e) {
      showScoreCalculationFailedDialog();
    } finally {
      isLoading(false);
    }
  }

  void nextStep() async {
    if (isLoading.value ||
        !formKeys[currentIndex.value].currentState!.validate()) {
      if (!formKeys[currentIndex.value].currentState!.validate()) {
        Get.snackbar(
          '',
          '',
          titleText: Text(
            'Perhatian',
            style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold, color: ColorsConstant.white),
          ),
          messageText: Text(
            'Harap lengkapi semua field yang diperlukan',
            style: TextStyleConstant.body.copyWith(
              color: ColorsConstant.white,
            ),
          ),
          backgroundColor: ColorsConstant.primary,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
      }
      return;
    }

    isLoading(true);

    try {
      switch (currentIndex.value) {
        case 0:
          await _executeUpdateStep(updateFirstStep);
          break;
        case 1:
          await _executeUpdateStep(updateSecondStep);
          break;
        case 2:
          await _executeUpdateStep(updateThirdStep);
          break;
        case 3:
          await _executeUpdateStep(updateFourthStep);
          break;
        case 4:
          await _executeUpdateStep(updateFifthStep);
          break;
        case 5:
          await _executeUpdateStep(updateSixStep);
          break;
        case 6:
          await _executeUpdateStep(updateSevenStep);
          break;
        case 7:
          await _executeUpdateStep(updateEightStep);
          return;
        default:
          throw Exception('Invalid step index');
      }

      _moveToNextStep();
    } catch (e) {
      debugPrint('Error in nextStep: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> _executeUpdateStep(Function updateFunction) async {
    try {
      await updateFunction();
    } catch (e) {
      debugPrint('Error in step update: $e');
      rethrow;
    }
  }

  void _moveToNextStep() {
    stepCompleted[currentIndex.value] = true;
    if (currentIndex.value < 7) {
      currentIndex.value++;
      update();
    }
  }

  void prevStep() {
    if (isLoading.value) return;

    isLoading(true);

    if (currentIndex.value > 0) {
      stepCompleted[currentIndex.value] = false;
      currentIndex.value--;
      if (currentIndex.value == 0) {
        stepCompleted[0] = false;
      }
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading(false);
    });
  }

  void setHasBusiness(String value) => hasBusiness.value = value;

  int calculateAge(String? birthDateString) {
    if (birthDateString == null || birthDateString.isEmpty) return 0;

    DateTime birthDate = DateFormat("yyyy-MM-dd").parse(birthDateString);
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  void showScoreCalculatedDialog() {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Perhitungan Skor Selesai',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 24, bottom: 16),
      onWillPop: () async {
        Get.back();
        return true;
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Assets.images.success.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Skor kredit telah berhasil dihitung',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {},
        child: Ink(
          width: 180,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'Lihat Skor',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showScoreCalculationFailedDialog() {
    Get.defaultDialog(
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Perhitungan Skor Gagal',
      titleStyle: TextStyleConstant.subHeading.copyWith(
        fontWeight: FontWeight.bold,
      ),
      titlePadding: const EdgeInsets.only(top: 24, bottom: 16),
      onWillPop: () async {
        Get.back();
        return true;
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Assets.images.success.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Terjadi kesalahan saat menghitung skor kredit.\nSilakan coba lagi.',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () => Get.back(),
        child: Ink(
          width: 180,
          height: 49,
          decoration: const BoxDecoration(
            color: ColorsConstant.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              'OK',
              style: TextStyleConstant.subHeading2.copyWith(
                color: ColorsConstant.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
