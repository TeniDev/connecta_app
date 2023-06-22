import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/login_providers.dart';

class LoginMobileView extends ConsumerWidget {
  const LoginMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(loginPageProvider);
    final notifier = ref.read(loginPageProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: notifier.formKeyLogin,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            FadeInDown(
              child: const Column(
                children: [
                  Text(
                    'Connecta',
                    style: AppStyles.title,
                  ),
                  Text(
                    'Inicio de sesión',
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
                      hint: 'Correo electrónico',
                      prefixIcon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 24),
                    CustomInput(
                      onChange: (value) => notifier.passwordController.text = value,
                      validator: (value) => notifier.validateFields(value, context),
                      hint: 'Contraseña',
                      prefixIcon: Icons.lock_outline,
                      obscureText: model.isObscurePassword,
                      onTapSuffixIcon: notifier.changeObscureInput,
                      suffixIconShow: true,
                      sufixIcon: model.isObscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),
                    const SizedBox(height: 36),
                    CustomButton(
                      onPressed: () => notifier.login(context),
                      label: 'Ingresar',
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes cuenta? ',
                      style: AppStyles.medium,
                    ),
                    Text(
                      'Regístrate',
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
