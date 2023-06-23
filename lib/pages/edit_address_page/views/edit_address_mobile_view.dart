import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../providers/edit_address_providers.dart';

class EditAddressMobileView extends ConsumerWidget {
  const EditAddressMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressToEditProvider);
    final model = ref.watch(editAddressPageProvider);
    final notifier = ref.read(editAddressPageProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: notifier.formKeyCreateAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => notifier.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'Editar dirección',
                style: AppStyles.title,
              ),
            ),
            const SizedBox(height: 48),
            CustomInput(
              initialValue: address?.address ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeAddress(value),
              validator: (value) => notifier.validateFields(value, context),
              hint: 'Dirección',
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.complement ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeComplement(value),
              validator: (value) => null,
              hint: 'Complemento de dirección (opcional)',
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.city ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeCity(value),
              validator: (value) => notifier.validateFields(value, context),
              hint: 'Ciudad',
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            const Text(
              'Puedes colocar un nombre para tu dirección, por ejemplo: Casa, Oficina, etc.',
              style: AppStyles.small,
            ),
            const SizedBox(height: 24),
            CustomInput(
              initialValue: address?.identifierName ?? '',
              onChange: (value) => ref.read(addressToEditProvider.notifier).changeIdentifierName(value),
              validator: (value) => null,
              hint: 'Nombre (opcional)',
              prefixIcon: Icons.home_outlined,
            ),
            const SizedBox(height: 48),
            Center(
              child: SizedBox(
                child: CustomButton(
                  onPressed: () => notifier.editAddress(context),
                  label: 'Editar dirección',
                  isLarge: true,
                  isLoading: model.isLoadingForm,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                child: CustomButton(
                  onPressed: () => notifier.pop(context),
                  label: 'Cancelar',
                  isLarge: true,
                  bgColor: AppColors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
