import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/providers/providers.dart';
import '../providers/login_providers.dart';

class LoginMobileView extends ConsumerWidget {
  const LoginMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(loginPageProvider);
    final notifier = ref.read(loginPageProvider.notifier);
    final translator = ref.read(localeProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: notifier.formKeyLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => notifier.goToSettings(context),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.settings,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            FadeInDown(
              child: Column(
                children: [
                  const Text(
                    'Connecta',
                    style: AppStyles.title,
                  ),
                  Text(
                    translator.translate(
                      context,
                      screen: 'login_page',
                      key: 'login_title',
                    ),
                    style: AppStyles.medium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            FadeInUp(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                decoration: BoxDecoration(
                  color: AppColors.greyThird,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    CustomInput(
                      onChange: (value) => notifier.userController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'login_page',
                        key: 'email_placeholder',
                      ),
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onChange: (value) => notifier.passwordController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'login_page',
                        key: 'password_placeholder',
                      ),
                      prefixIcon: Icons.lock_outline,
                      obscureText: model.isObscurePassword,
                      onTapSuffixIcon: notifier.changeObscureInput,
                      suffixIconShow: true,
                      sufixIcon: model.isObscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),
                    const SizedBox(height: 36),
                    CustomButton(
                      onPressed: () => notifier.login(context),
                      label: translator.translate(
                        context,
                        screen: 'login_page',
                        key: 'login_button',
                      ),
                      isLoading: model.isLoadingForm,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            FadeInUp(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.push(RoutesNames.registerRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translator.translate(
                        context,
                        screen: 'login_page',
                        key: 'dont_have_account',
                      ),
                      style: AppStyles.medium,
                    ),
                    Text(
                      translator.translate(
                        context,
                        screen: 'login_page',
                        key: 'sign_up',
                      ),
                      style: AppStyles.link,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
