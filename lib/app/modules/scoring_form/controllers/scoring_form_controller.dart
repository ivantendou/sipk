import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_home/controllers/ao_home_controller.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/scoring_service.dart';
import 'package:sipk/models/fetch_eight_step_model.dart';
import 'package:sipk/models/fetch_fifth_step_model.dart';
import 'package:sipk/models/fetch_first_step_model.dart';
import 'package:sipk/models/fetch_fourth_step_model.dart';
import 'package:sipk/models/fetch_second_step_model.dart';
import 'package:sipk/models/fetch_seventh_step_model.dart';
import 'package:sipk/models/fetch_sixth_step_model.dart';
import 'package:sipk/models/fetch_third_step_model.dart';

class ScoringFormController extends GetxController {
  final ScoringService scoringService = ScoringService();
  var applicantId = ''.obs;
  var currentIndex = 0.obs;
  final isScoringDraft = false.obs;
  var stepCompleted = List.generate(8, (index) => false).obs;
  final formKeys = List.generate(8, (index) => GlobalKey<FormState>());
  bool _isUpdatingFields = false;

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
  final TextEditingController employeeCountController =
      TextEditingController(text: "1");
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

  Rx<String> hasBusiness = Rx<String>('Tidak');
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
    if (args is Map<String, dynamic>) {
      applicantId.value = args['applicantId'] ?? '';
      isScoringDraft.value = args['isScoringDraft'] ?? false;
    }
    if (isScoringDraft.value == true) {
      fetchScoringSteps();
    }
    downPaymentPctController.addListener(_onDownPaymentPctChanged);
    downPaymentAmtController.addListener(_onDownPaymentAmtChanged);
    applicationAmountController.addListener(_onApplicationAmountChanged);
  }

  void callAoHomeController() {
    final secondController = Get.find<AoHomeController>();

    secondController.fetchCreditScores();
  }

  void deleteForm() async {
    await scoringService.deleteForm(applicantId: applicantId.value);
    Get.back();
  }

  void fetchScoringSteps() async {
    try {
      isLoading(true);
      // First Step
      final firstStepResponse =
          await scoringService.fetchFirstStep(applicantId.value);
      final secondStepResponse =
          await scoringService.fetchSecondStep(applicantId.value);
      final thirdStepResponse =
          await scoringService.fetchThirdStep(applicantId.value);
      final fourthStepResponse =
          await scoringService.fetchFourthStep(applicantId.value);
      final fifthStepResponse =
          await scoringService.fetchFifthStep(applicantId.value);
      final sixthStepResponse =
          await scoringService.fetchSixthStep(applicantId.value);
      final seventhStepResponse =
          await scoringService.fetchSeventhStep(applicantId.value);
      final eighthStepResponse =
          await scoringService.fetchEightStep(applicantId.value);
      isLoading(false);
      final firstStepData = FetchFirstStepModel.fromJson(firstStepResponse);
      // First Step Assignment
      applicantNameController.text = firstStepData.applicant?.name ?? '';
      ktpNumberController.text = firstStepData.applicant?.ktpNumber ?? '';
      ktpAddressController.text = firstStepData.applicant?.ktpAddress ?? '';
      residentialAddressController.text =
          firstStepData.applicant?.residentialAddress ?? '';
      regencyController.text = firstStepData.applicant?.regency ?? '';
      provinceController.text = firstStepData.applicant?.province ?? '';
      postalCodeController.text = firstStepData.applicant?.postalCode ?? '';
      placeOfBirthController.text = firstStepData.applicant?.placeOfBirth ?? '';
      dateOfBirth.value =
          firstStepData.applicant?.dateOfBirth?.toIso8601String();
      motherNameController.text = firstStepData.applicant?.motherName ?? '';
      homePhoneController.text = firstStepData.applicant?.homePhone ?? '';
      mobilePhoneController.text = firstStepData.applicant?.mobilePhone ?? '';
      gender.value = firstStepData.applicant?.gender;
      companyNameController.text = firstStepData.applicant?.companyName ?? '';
      companyAddressController.text =
          firstStepData.applicant?.companyAddress ?? '';
      bossNameController.text = firstStepData.applicant?.bossName ?? '';
      applicantCategory.value =
          firstStepData.creditEvaluation?.applicantCategory;
      maritalStatus.value = firstStepData.creditEvaluation?.maritalStatus;
      dependentsCountController.text =
          firstStepData.creditEvaluation?.dependentsCount?.toString() ?? '';
      educationLevel.value = firstStepData.creditEvaluation?.educationLevel;
      selfEmploymentType.value =
          firstStepData.creditEvaluation?.selfEmploymentType;
      employmentType.value = firstStepData.creditEvaluation?.employmentType;
      spouseNameController.text = firstStepData.spouse?.name ?? '';
      spouseKtpNumberController.text = firstStepData.spouse?.ktpNumber ?? '';
      spousePlaceOfBirthController.text =
          firstStepData.spouse?.placeOfBirth ?? '';
      spouseDateOfBirth.value =
          firstStepData.spouse?.dateOfBirth?.toIso8601String();
      spouseOccupationController.text = firstStepData.spouse?.occupation ?? '';
      spouseMotherNameController.text = firstStepData.spouse?.motherName ?? '';
      spouseAddressController.text = firstStepData.spouse?.address ?? '';
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(0)) currentIndex.value++;

      // Second Step
      final secondStepData = FetchSecondStepModel.fromJson(secondStepResponse);
      financingType.value = secondStepData.financingApplication?.financingType;
      applicationAmountController.text =
          secondStepData.financingApplication?.applicationAmount?.toString() ??
              '';
      downPaymentPctController.text =
          secondStepData.financingApplication?.downPaymentPct?.toString() ?? '';
      downPaymentAmtController.text =
          secondStepData.financingApplication?.downPaymentAmt?.toString() ?? '';
      allocationController.text =
          secondStepData.financingApplication?.allocation ?? '';
      var financingIterationTemp =
          secondStepData.creditEvaluation?.financingIteration;
      if (financingIterationTemp != null) {
        financingIteration.value = financingIterationTemp == 11
            ? ">10"
            : financingIterationTemp.toString();
      }

      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(1)) currentIndex.value++;

      // Third Step
      final thirdStepData = FetchThirdStepModel.fromJson(thirdStepResponse);
      netSalaryApplicantController.text =
          thirdStepData.financialData?.netSalaryApplicant?.toString() ?? '';
      netSalarySpouseController.text =
          thirdStepData.financialData?.netSalarySpouse?.toString() ?? '';
      netBusinessIncomeApplicantController.text =
          thirdStepData.financialData?.netBusinessIncomeApplicant?.toString() ??
              '';
      netBusinessIncomeSpouseController.text =
          thirdStepData.financialData?.netBusinessIncomeSpouse?.toString() ??
              '';
      if (thirdStepData.financialData?.netBusinessIncomeApplicant != null ||
          thirdStepData.financialData?.netBusinessIncomeSpouse != null) {
        hasBusiness.value = "Ya";
      }
      householdExpenseController.text =
          thirdStepData.financialData?.householdExpense?.toString() ?? '';
      transportationExpenseController.text =
          thirdStepData.financialData?.transportationExpense?.toString() ?? '';
      communicationExpenseController.text =
          thirdStepData.financialData?.communicationExpense?.toString() ?? '';
      educationExpenseController.text =
          thirdStepData.financialData?.educationExpense?.toString() ?? '';
      utilityBillsController.text =
          thirdStepData.financialData?.utilityBills?.toString() ?? '';
      ongoingInstallmentController.text =
          thirdStepData.financialData?.ongoingInstallment?.toString() ?? '';
      entertainmentExpenseController.text =
          thirdStepData.financialData?.entertainmentSocialExpense?.toString() ??
              '';
      ekvRateController.text =
          thirdStepData.financialData?.ekvRate?.toString() ?? '';
      installmentType.value =
          thirdStepData.financialData?.installmentType ?? '';
      financingTermController.text =
          thirdStepData.creditEvaluation?.financingTerm?.toString() ?? '';
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(2)) currentIndex.value++;

      // Fourth Step
      final fourthStepData = FetchFourthStepModel.fromJson(fourthStepResponse);
      businessReport.value = fourthStepData.businessReport;
      employmentBusinessDurationController.text =
          fourthStepData.employmentBusinessDuration?.toString() ?? '';
      paymentReceiptMethod.value = fourthStepData.paymentReceiptMethod;
      businessPremisesStatus.value = fourthStepData.businessPremisesStatus;
      salesMethod.value = fourthStepData.salesMethod;
      employeeCountController.text =
          fourthStepData.employeeCount?.toString() ?? '';
      businessAdministration.value = fourthStepData.businessAdministration;
      businessLiabilities.value = fourthStepData.businessLiabilities;
      employmentStatus.value = fourthStepData.employmentStatus;
      employerCredibility.value = fourthStepData.employerCredibility;
      salarySlip.value = fourthStepData.salarySlip;
      accountStatement.value = fourthStepData.accountStatement;
      workplaceReputation.value = fourthStepData.workplaceReputation;
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(3)) currentIndex.value++;

      // Fifth Step
      final fifthStepData = FetchFifthStepModel.fromJson(fifthStepResponse);
      salesController.text = fifthStepData.sales?.toString() ?? '';
      if (fifthStepData.sales != null) {
        hasBusiness.value = "Ya";
      }
      cogsController.text = fifthStepData.cogs?.toString() ?? '';
      dailyLaborController.text = fifthStepData.dailyLabor?.toString() ?? '';
      consumptionController.text = fifthStepData.consumption?.toString() ?? '';
      transportCostController.text =
          fifthStepData.transportCosts?.toString() ?? '';
      fuelController.text = fifthStepData.fuel?.toString() ?? '';
      packagingController.text = fifthStepData.packaging?.toString() ?? '';
      depreciationController.text =
          fifthStepData.depreciation?.toString() ?? '';
      otherCostsController.text = fifthStepData.otherCosts?.toString() ?? '';
      activeDaysController.text = fifthStepData.activeDays?.toString() ?? '';
      monthlyLaborController.text =
          fifthStepData.monthlyLabor?.toString() ?? '';
      rentalController.text = fifthStepData.rental?.toString() ?? '';
      assetMaintenanceController.text =
          fifthStepData.assetMaintenance?.toString() ?? '';
      utilitiesController.text = fifthStepData.utilities?.toString() ?? '';
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(4)) currentIndex.value++;

      // Sixth Step
      final sixthStepData = FetchSixthStepModel.fromJson(sixthStepResponse);
      residenceOwnership.value = sixthStepData.residenceOwnership;
      residenceDurationController.text =
          sixthStepData.residenceDuration?.toString() ?? '';
      neighborhoodReputation.value = sixthStepData.neighborhoodReputation;
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(5)) currentIndex.value++;

      // Seventh Step
      final seventhStepData =
          FetchSeventhStepModel.fromJson(seventhStepResponse);
      bankingRelationship.value = seventhStepData.bankingRelationship;
      averageMonthlyBalance.value = seventhStepData.averageMonthlyBalance;
      averageTransactionFrequency.value =
          seventhStepData.averageTransactionFrequency;
      applicantCreditQuality.value = seventhStepData.applicantCreditQuality;
      applicantCreditRating.value = seventhStepData.applicantCreditRating;
      spouseCreditRating.value = seventhStepData.spouseCreditRating;
      await Future.delayed(const Duration(milliseconds: 200));
      if (_validateStep(6)) currentIndex.value++;

      // Eighth Step
      final eighthStepData = FetchEightStepModel.fromJson(eighthStepResponse);
      applicationCoverage.value = eighthStepData.applicationCoverage;
      vehicleCollateralInsurance.value =
          eighthStepData.vehicleCollateralInsurance;
      applicantLifeInsurance.value = eighthStepData.applicantLifeInsurance;
      collateralBinding.value = eighthStepData.collateralBinding;
    } catch (e) {
      showFetchDataFailed();
      if (kDebugMode) {
        print('Error fetching scoring steps: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  bool _validateStep(int stepIndex) {
    final form = formKeys[stepIndex].currentState;
    if (form == null) return false;
    final isValid = form.validate();
    if (!isValid) {
      currentIndex.value = stepIndex;
      return false;
    } else {
      stepCompleted[stepIndex] = true;
      return true;
    }
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
      isEmployee: !isOwnBusiness,
    );
    callAoHomeController();
  }

  void updateSecondStep() async {
    if (financingIteration.value == ">10") {
      financingIteration.value = "11";
    }

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
      financingTerm: double.tryParse(financingTermController.text),
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
      employeeCount: int.tryParse(employeeCountController.text),
      employerCredibility: employerCredibility.value,
      employmentBusinessDuration:
          int.tryParse(employmentBusinessDurationController.text),
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
      title: 'Scoring Completed',
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
              'Credit Score calculated successfully',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
          Get.offNamed(
            Routes.AO_SCORING_DETAIL,
            parameters: {'id': applicantId.value},
          );
        },
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
              'View Score',
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
      title: 'Scoring Failed',
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
            Assets.images.errorImage.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'An error occurred while calculating the credit score.\nPlease try again.',
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

  void showFetchDataFailed() {
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: ColorsConstant.white,
      contentPadding: const EdgeInsets.only(bottom: 24),
      title: 'Get Scoring Data Failed',
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
            Assets.images.errorImage.svg(
              width: 80,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'An error occurred while retrieving the scoring data. Please check your internet connection and try again.',
              style: TextStyleConstant.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      confirm: InkWell(
        onTap: () {
          Get.back();
          Get.back();
        },
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

  void _onDownPaymentPctChanged() {
    if (_isUpdatingFields) return;

    final percentText = downPaymentPctController.text;
    if (percentText.isEmpty) return;

    final applicationAmountText = applicationAmountController.text;
    if (applicationAmountText.isEmpty) return;

    try {
      var percentValue = double.parse(percentText) / 100;
      var applicationAmount = double.parse(applicationAmountText);
      final downPaymentAmount = applicationAmount * percentValue;

      _isUpdatingFields = true;
      downPaymentAmtController.text = downPaymentAmount.round().toString();
      _isUpdatingFields = false;

      if (kDebugMode) {
        print(
            'Updated downPaymentAmtController to: ${downPaymentAmtController.text}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error menghitung jumlah uang muka: $e');
      }
    }
  }

  void _onDownPaymentAmtChanged() {
    if (_isUpdatingFields) return;

    final amountText = downPaymentAmtController.text;
    if (amountText.isEmpty) return;

    final applicationAmountText = applicationAmountController.text;
    if (applicationAmountText.isEmpty) return;

    try {
      final downPaymentAmount = double.parse(amountText);
      final applicationAmount = double.parse(applicationAmountText);
      if (applicationAmount <= 0) return;
      final percentValue = (downPaymentAmount / applicationAmount) * 100;

      _isUpdatingFields = true;
      downPaymentPctController.text = percentValue.toStringAsFixed(2);
      _isUpdatingFields = false;

      if (kDebugMode) {
        print(
            'Updated downPaymentPctController to: ${downPaymentPctController.text}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error menghitung persentase uang muka: $e');
      }
    }
  }

  void _onApplicationAmountChanged() {
    if (_isUpdatingFields) return;

    if (downPaymentPctController.text.isNotEmpty) {
      _onDownPaymentPctChanged();
    } else if (downPaymentAmtController.text.isNotEmpty) {
      _onDownPaymentAmtChanged();
    }
  }

  @override
  void onClose() {
    downPaymentPctController.removeListener(_onDownPaymentPctChanged);
    downPaymentAmtController.removeListener(_onDownPaymentAmtChanged);
    applicationAmountController.removeListener(_onApplicationAmountChanged);

    super.onClose();
  }
}
