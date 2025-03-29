import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  Rx<String?> selectedOccupation = Rx<String?>('Buruh Harian');
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

  //sample
  final sampleController = TextEditingController();
  // RxString stringVariable = RxString("");
  var selectedDate = Rxn<String>();
  Rx<String> hasBusiness = Rx<String>('Tidak');

  bool get isOwnBusiness => [
        'Buruh Harian',
        'Pedagang',
        'Wiraswasta',
        'Profesional',
      ].contains(selectedOccupation.value);
  var isButtonDisabled = false.obs;

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

    Future.delayed(const Duration(seconds: 1), () {
      isButtonDisabled.value = false;
    });
  }

  void nextStep() {
    if (isButtonDisabled.value || !formKeys[currentIndex.value].currentState!.validate()) return;
    isButtonDisabled.value = true;

    stepCompleted[currentIndex.value] = true;
    if (currentIndex.value < 7) {
      currentIndex.value++;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isButtonDisabled.value = false;
    });
  }

  void prevStep() {
    if (isButtonDisabled.value) return;
    isButtonDisabled.value = true;

    if (currentIndex.value > 0) {
      stepCompleted[currentIndex.value] = false;
      currentIndex.value--;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      isButtonDisabled.value = false;
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
}
