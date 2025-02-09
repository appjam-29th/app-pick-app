import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:flutter/material.dart';

enum AppTextFieldState {
  basic,
  email,
  password,
  search,
}

class AppTextField extends StatefulWidget {
  final AppTextFieldState textFieldState;
  final TextEditingController controller;
  final String? validator;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color cursorColor;
  final Color cursorErrorColor;
  final EdgeInsetsGeometry contentPadding;
  final String topText;
  final String hintText;
  final TextStyle hintStyle;
  final Color hintColor;
  final VoidCallback? onEditingComplete;
  final EdgeInsetsGeometry padding;
  final bool expands;
  final int? minLine;
  final int? maxLine;

  const AppTextField({
    super.key,
    required this.textFieldState,
    required this.controller,
    required this.hintText,
    this.validator,
    this.onEditingComplete,
    this.topText = '',
    this.backgroundColor = AppColor.fillAlternative,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.textStyle = AppTypography.captionMedium,
    this.cursorColor = AppColor.common0,
    this.cursorErrorColor = AppColor.statusError,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 16,
    ),
    this.hintStyle = AppTypography.captionMedium,
    this.hintColor = AppColor.labelAlternative,
    this.padding = const EdgeInsets.all(10),
    this.expands = false,
    this.maxLine,
    this.minLine
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '아이디를 입력하세요.';
    }
    if (value.length < 5) {
      return '아이디는 최소 5자 이상이어야 합니다.';
    }
    return null; // 유효하면 null 반환
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]+$')
        .hasMatch(value)) {
      return '영문과 숫자를 포함해야 합니다.';
    }
    return null; // 통과하면 null 반환
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.topText == ''
              ? SizedBox(height: 0,)
              : Text(
                  widget.topText,
                  style: AppTypography.labelBold.copyWith(
                    color: AppColor.common0,
                  ),
                ),
          TextFormField(
            maxLines: widget.maxLine,
            minLines: widget.minLine,
            expands : widget.expands,
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: (value) {
              if (widget.textFieldState == AppTextFieldState.email) {
                return _validateEmail(value);
              } else if (widget.textFieldState == AppTextFieldState.password) {
                return _validatePassword(value);
              } else if (widget.textFieldState == AppTextFieldState.basic &&
                  widget.validator != null) {
                return widget.validator;
              } else {
                return null;
              }
            },
            style: widget.textStyle,
            cursorColor: widget.cursorColor,
            cursorErrorColor: widget.cursorErrorColor,
            onEditingComplete: widget.onEditingComplete,
            obscureText: widget.textFieldState == AppTextFieldState.password
                ? true
                : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.backgroundColor,
              contentPadding: widget.contentPadding,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle.copyWith(
                color: widget.hintColor,
              ),
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
