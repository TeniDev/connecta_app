import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/providers/providers.dart';
import '../providers/create_address_providers.dart';

class CreateAddressMobileView extends ConsumerWidget {
  const CreateAddressMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(createAddressPageProvider);
    final notifier = ref.read(createAddressPageProvider.notifier);
    final translator = ref.read(localeProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: notifier.formKeyCreateAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeft(
              from: 30,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => notifier.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInDown(
              from: 30,
              child: Center(
                child: Text(
                  translator.translate(
                    context,
                    screen: 'create_address_page',
                    key: 'create_address_title',
                  ),
                  style: AppStyles.title,
                ),
              ),
            ),
            const SizedBox(height: 48),
            CustomInput(
              onChange: (value) => notifier.addressController.text = value,
              validator: (value) => notifier.validateFields(value, context),
              hint: translator.translate(
                context,
                screen: 'create_address_page',
                key: 'address_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              onChange: (value) => notifier.complementController.text = value,
              validator: (value) => null,
              hint: translator.translate(
                context,
                screen: 'create_address_page',
                key: 'complement_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              onChange: (value) => notifier.cityController.text = value,
              validator: (value) => notifier.validateFields(value, context),
              hint: translator.translate(
                context,
                screen: 'create_address_page',
                key: 'city_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            Text(
              translator.translate(
                context,
                screen: 'create_address_page',
                key: 'name_text',
              ),
              style: AppStyles.small,
            ),
            const SizedBox(height: 24),
            CustomInput(
              onChange: (value) => notifier.identifierNameController.text = value,
              validator: (value) => null,
              hint: translator.translate(
                context,
                screen: 'create_address_page',
                key: 'identifier_name_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            FadeInUp(
              from: 30,
              child: Center(
                child: CustomButton(
                  onPressed: () => notifier.createAddress(context),
                  label: translator.translate(
                    context,
                    screen: 'create_address_page',
                    key: 'create_address_button',
                  ),
                  isLarge: true,
                  isLoading: model.isLoadingForm,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
