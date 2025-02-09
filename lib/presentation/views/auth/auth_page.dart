import 'package:appjam_29th/core/utils/component/button.dart';
import 'package:appjam_29th/core/utils/component/textfield.dart';
import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/views/auth/signup_page.dart';
import 'package:appjam_29th/presentation/views/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigator() => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (builder) => MainPage(),
        ),
        (_) => false);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Hero(
              tag: 'logo',
              child: AppIcon.logo(),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  AppTextField(
                    textFieldState: AppTextFieldState.email,
                    controller: context.read<AuthProvider>().idController,
                    hintText: '아이디를 입력해주세요',
                    topText: '아이디',
                  ),
                  AppTextField(
                    maxLine: 1,
                    textFieldState: AppTextFieldState.password,
                    controller: context.read<AuthProvider>().pwController,
                    hintText: '비밀번호를 입력하세요',
                    topText: '비밀번호',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    spacing: 15,
                    children: [
                      AppButton(
                        onTap: () async {
                          if (await context.read<AuthProvider>().login()) {
                            navigator();
                          }
                        },
                        text: '로그인하기',
                      ),
                      Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '계정이 없으신가요?',
                            style: AppTypography.labelMedium.copyWith(
                              color: AppColor.common0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SignupPage(),
                              ),
                            ),
                            child: Text(
                              '회원가입',
                              style: AppTypography.labelBold.copyWith(
                                color: AppColor.secondaryNormal,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
