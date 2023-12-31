import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/providers/providers.dart';
import '../providers/edit_address_providers.dart';

class EditAddressMobileView extends ConsumerWidget {
  const EditAddressMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressToEditProvider);
    final model = ref.watch(editAddressPageProvider);
    final notifier = ref.read(editAddressPageProvider.notifier);
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
                    screen: 'edit_address_page',
                    key: 'edit_address_title',
                  ),
                  style: AppStyles.title,
                ),
              ),
            ),
            const SizedBox(height: 48),
            CustomInput(
              initialValue: address?.address ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeAddress(value),
              validator: (value) => notifier.validateFields(value, context),
              hint: translator.translate(
                context,
                screen: 'edit_address_page',
                key: 'address_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.complement ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeComplement(value),
              validator: (value) => null,
              hint: translator.translate(
                context,
                screen: 'edit_address_page',
                key: 'complement_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.city ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeCity(value),
              validator: (value) => notifier.validateFields(value, context),
              hint: translator.translate(
                context,
                screen: 'edit_address_page',
                key: 'city_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            Text(
              translator.translate(
                context,
                screen: 'edit_address_page',
                key: 'name_text',
              ),
              style: AppStyles.small,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.identifierName ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeIdentifierName(value),
              validator: (value) => null,
              hint: translator.translate(
                context,
                screen: 'edit_address_page',
                key: 'identifier_name_placeholder',
              ),
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            FadeInUp(
              from: 30,
              child: Center(
                child: SizedBox(
                  child: CustomButton(
                    onPressed: () => notifier.editAddress(context),
                    label: translator.translate(
                      context,
                      screen: 'edit_address_page',
                      key: 'edit_address_button',
                    ),
                    isLarge: true,
                    isLoading: model.isLoadingForm,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FadeInUp(
              from: 30,
              child: Center(
                child: SizedBox(
                  child: CustomButton(
                    onPressed: () => notifier.pop(context),
                    label: translator.translate(
                      context,
                      screen: 'edit_address_page',
                      key: 'cancel_text',
                    ),
                    isLarge: true,
                    bgColor: AppColors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
