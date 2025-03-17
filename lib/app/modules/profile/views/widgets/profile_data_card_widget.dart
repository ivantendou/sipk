// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ProfileDataCardWidget extends StatelessWidget {
  final String? name;
  final String? role;
  final String? telephoneNumber;
  final String? email;

  const ProfileDataCardWidget({
    Key? key,
    this.name,
    this.role,
    this.telephoneNumber,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: ColorsConstant.white,
        boxShadow: [
          BoxShadow(
            color: ColorsConstant.black.withValues(alpha: 0.2),
            offset: const Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelValueWidget(
            label: 'Nama',
            value: name,
          ),
          const SizedBox(height: 8),
          LabelValueWidget(
            label: 'Jabatan',
            value: role,
          ),
          const SizedBox(height: 8),
          LabelValueWidget(
            label: 'Nomor Telepon',
            value: telephoneNumber,
          ),
          const SizedBox(height: 8),
          LabelValueWidget(
            label: 'Email',
            value: email,
          ),
        ],
      ),
    );
  }
}
