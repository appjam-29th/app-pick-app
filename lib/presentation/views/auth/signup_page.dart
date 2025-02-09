import 'package:appjam_29th/core/utils/component/back_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/component/button.dart';
import '../../../core/utils/component/textfield.dart';
import '../../../core/utils/theme/icon.dart';
import '../../provider/auth_provider.dart';
import '../main/main_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigator() => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (builder) => MainPage(),
        ),
        (_) => false);

    return Scaffold(
      body: Stack(
        children: [
          BackButtonAppbar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon.logo(),
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
                              if (await context.read<AuthProvider>().signUp()) {
                                navigator();
                              }
                            },
                            text: '회원가입',
                          ),
                          SizedBox(
                            height: 18,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
