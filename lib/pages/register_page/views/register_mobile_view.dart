import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/providers/providers.dart';
import '../providers/register_providers.dart';

class RegisterMobileView extends ConsumerWidget {
  const RegisterMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(registerPageProvider);
    final notifier = ref.read(registerPageProvider.notifier);
    final locale = ref.watch(localeProvider);
    final translator = ref.read(localeProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: notifier.formKeyRegister,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            FadeInLeft(
              child: Column(
                children: [
                  const Text(
                    'Connecta',
                    style: AppStyles.title,
                  ),
                  Text(
                    translator.translate(
                      context,
                      screen: 'signup_page',
                      key: 'signup_title',
                    ),
                    style: AppStyles.medium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            FadeInRight(
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
                      onChange: (value) => notifier.nameController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'name_placeholder',
                      ),
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onChange: (value) => notifier.lastNameController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'last_name_placeholder',
                      ),
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onChange: (value) => notifier.emailController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'email_placeholder',
                      ),
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          locale: locale,
                          initialDatePickerMode: DatePickerMode.year,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );

                        if (pickedDate != null) {
                          notifier.changeBirthday(pickedDate);
                        }
                      },
                      validator: (_) => null,
                      hint: model.birthday != null
                          ? DateFormat('dd/MM/yyyy').format(model.birthday!)
                          : translator.translate(
                              context,
                              screen: 'signup_page',
                              key: 'birthdate_placeholder',
                            ),
                      prefixIcon: Icons.calendar_month_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onChange: (value) => notifier.passwordController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: translator.translate(
                        context,
                        screen: 'signup_page',
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
                      onPressed: () => notifier.signup(context),
                      label: translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'signup_button',
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
                onTap: () => notifier.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'already_have_account',
                      ),
                      style: AppStyles.medium,
                    ),
                    Text(
                      translator.translate(
                        context,
                        screen: 'signup_page',
                        key: 'sign_in',
                      ),
                      style: AppStyles.link,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
