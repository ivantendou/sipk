// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

class SubmissionButtonWidget extends StatelessWidget {
  final void Function()? onTap;

  const SubmissionButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: ColorsConstant.white,
        border: Border(
          top: BorderSide(
            color: ColorsConstant.grey500,
            width: 1,
          ),
        ),
      ),
      child: CustomIconButtonWidget(
        icon: Assets.images.document.svg(),
        text: 'Ajukan Permohonan Pembiayaan',
        onTap: (){},
      ),
    );
  }
}
