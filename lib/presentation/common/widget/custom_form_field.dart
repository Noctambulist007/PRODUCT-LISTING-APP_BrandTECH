import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:productify/presentation/theme/color.dart';
import 'package:productify/presentation/theme/text_styles.dart';

class CustomFormField extends StatefulWidget {
  final String name;
  final String labelText;
  final String hintText;
  final String? iconPath;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<FormFieldValidator<String>> validators;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onSubmitted;
  final String? initialValue;
  final bool readOnly;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int maxLines;

  const CustomFormField({
    super.key,
    required this.name,
    required this.labelText,
    required this.hintText,
    this.iconPath,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validators = const [],
    this.onChanged,
    this.onSubmitted,
    this.initialValue,
    this.readOnly = false,
    this.suffixIcon,
    this.focusNode,
    this.maxLines = 1,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _showPassword = false;

  InputBorder _getInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: AppColors.secondaryTextDarker);
    final enabledBorder = _getInputBorder(Colors.transparent);
    final focusedBorder = _getInputBorder(AppColors.grayscaleBorderDisabled);
    final errorBorder = _getInputBorder(Colors.red);

    Widget? prefixIconWidget;
    if (widget.iconPath != null) {
      prefixIconWidget = SvgPicture.asset(
        widget.iconPath!,
        width: 32.w,
        height: 32.h,
        colorFilter: ColorFilter.mode(
          AppColors.primaryIconDefault,
          BlendMode.srcIn,
        ),
        fit: BoxFit.scaleDown,

      );
    }

    Widget? suffixIconWidget = widget.suffixIcon;
    if (widget.isPassword) {
      suffixIconWidget = IconButton(
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        },
        icon: Icon(
          !_showPassword ? Icons.visibility : Icons.visibility_off,
          color: AppColors.secondaryIconDefault,
        ),
      );
    }

    return FormBuilderTextField(
      maxLines: widget.maxLines,
      name: widget.name,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.primaryTextDefault),
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      cursorColor: AppColors.colorPrimary,
      cursorWidth: 1,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && !_showPassword,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onSubmitted: (_) => widget.onSubmitted?.call(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: AppTextStyles.labelL5Regular.copyWith(
          color: AppColors.primaryTextDefault,
        ),
        hintStyle: hintStyle,
        prefixIcon: prefixIconWidget,
        suffixIcon: suffixIconWidget,
        filled: true,
        fillColor: AppColors.colorWhite,
        contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
      validator: FormBuilderValidators.compose(widget.validators),
    );
  }
}
