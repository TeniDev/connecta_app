import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/utils.dart';
import '../../../data/models/models.dart';
import '../providers/home_providers.dart';

class AddressCard extends ConsumerWidget {
  const AddressCard({Key? key, required this.address}) : super(key: key);

  final AddressModel address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColors.greyThird,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(
                    Icons.star_border_outlined,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      address.address,
                      style: AppStyles.small,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  address.complement != null && address.complement!.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                address.complement!,
                                style: AppStyles.small.copyWith(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        )
                      : const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: Text(
                      address.identifierName != null && address.identifierName!.isNotEmpty
                          ? '${address.city} - ${address.identifierName}'
                          : address.city,
                      style: AppStyles.small.copyWith(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () => ref.read(homePageProvider.notifier).goToEditAddress(
                      context: context,
                      address: address,
                    ),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          'Eliminar dirección',
                          style: AppStyles.large,
                        ),
                        content: const Text(
                          '¿Estás seguro de eliminar esta dirección?',
                          style: AppStyles.small,
                        ),
                        backgroundColor: AppColors.black,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancelar',
                              style: AppStyles.small,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.read(homePageProvider.notifier).deleteAddress(address.id);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Eliminar',
                              style: AppStyles.small.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
