import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/utils/form_validators.dart';

class RupiahInputFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String? hintText;
  final void Function(String)? onChanged;

  const RupiahInputFieldWidget({
    Key? key,
    required this.controller,
    required this.fieldTitle,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RupiahInputFieldWidget> createState() => _RupiahInputFieldWidgetState();
}

class _RupiahInputFieldWidgetState extends State<RupiahInputFieldWidget> {
  late TextEditingController _displayController;
  late final NumberFormat _numberFormat;
  late final CurrencyTextInputFormatter _formatter;

  String _rawValue = '';

  @override
  void initState() {
    super.initState();
    _displayController = TextEditingController();
    _numberFormat = NumberFormat('#,###', 'id_ID');
    _formatter = CurrencyTextInputFormatter(
      _numberFormat,
      onChange: _onFormatterChange,
    );

    // Set initial value if controller already has value
    if (widget.controller.text.isNotEmpty) {
      _rawValue = widget.controller.text;
      _updateDisplayFromRawValue();
    }
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  // This gets called when the formatter changes the text
  void _onFormatterChange(String formattedValue) {
    // Extract raw value (without separators)
    _rawValue = formattedValue.replaceAll('.', '');
    widget.controller.text = _rawValue;

    if (widget.onChanged != null) {
      widget.onChanged!(_rawValue);
    }
  }

  // Convert raw value to formatted display
  void _updateDisplayFromRawValue() {
    if (_rawValue.isNotEmpty) {
      // Use the NumberFormat directly to format the raw value
      try {
        final num parsedValue = int.parse(_rawValue);
        _displayController.text = _numberFormat.format(parsedValue);
      } catch (e) {
        _displayController.text = _rawValue;
      }
    } else {
      _displayController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldTitle,
          style: TextStyleConstant.body,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _displayController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            prefixIcon: SizedBox(
              width: 52,
              child: Center(
                child: Text(
                  'Rp',
                  style: TextStyleConstant.body.copyWith(
                    color: ColorsConstant.grey900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            hintText: widget.hintText,
          ),
          inputFormatters: [_formatter],
          keyboardType: TextInputType.number,
          style: TextStyleConstant.body,
          textInputAction: TextInputAction.next,
          validator: (value) =>
              FormValidators.validateCurrency(value, widget.fieldTitle),
        )
      ],
    );
  }
}
