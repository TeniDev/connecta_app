import 'package:connecta_app/pages/home_page/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../providers/home_providers.dart';

class HomeMobileView extends ConsumerWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userSessionProvider);
    final state = ref.watch(homePageProvider);
    final notifier = ref.read(homePageProvider.notifier);
    final translator = ref.read(localeProvider.notifier);

    return user != null
        ? Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                color: AppColors.black,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Expanded(
                      child: StreamBuilder<List<AddressModel>>(
                        stream:
                            state.isSearching ? notifier.searchUserAddressStream() : notifier.getUserAddressStream(),
                        builder: (BuildContext context, AsyncSnapshot<List<AddressModel>> snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    translator.translate(
                                      context,
                                      screen: 'home_page',
                                      key: 'cant_load_your_addresses',
                                    ),
                                    style: AppStyles.medium,
                                  ),
                                  Text(
                                    translator.translate(
                                      context,
                                      screen: 'home_page',
                                      key: 'try_again_later',
                                    ),
                                    style: AppStyles.small,
                                  ),
                                ],
                              ),
                            );
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2,
                                  ),
                                ],
                              ),
                            );
                          }

                          if (snapshot.data!.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    translator.translate(
                                      context,
                                      screen: 'home_page',
                                      key: 'dont_have_addresses',
                                    ),
                                    style: AppStyles.medium,
                                  ),
                                  Text(
                                    translator.translate(
                                      context,
                                      screen: 'home_page',
                                      key: 'add_new_address',
                                    ),
                                    style: AppStyles.small,
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView(children: [
                            ...snapshot.data!.map((AddressModel address) {
                              return AddressCard(
                                address: address,
                              );
                            }).toList(),
                            const SizedBox(height: 60),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: AppColors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${translator.translate(
                                context,
                                screen: 'home_page',
                                key: 'hi_user',
                              )}${user.name}',
                              style: AppStyles.medium,
                            ),
                            Text(
                              user.email,
                              style: AppStyles.small.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        InkWell(
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
                      ],
                    ),
                    CustomInput(
                      controller: TextEditingController.fromValue(
                        TextEditingValue(
                            text: notifier.searchController.text,
                            selection: TextSelection(
                              baseOffset: notifier.searchController.text.length,
                              extentOffset: notifier.searchController.text.length,
                            )),
                      ),
                      onChange: (value) => notifier.searchAddress(value),
                      validator: (value) {},
                      hint: translator.translate(
                        context,
                        screen: 'home_page',
                        key: 'search_placeholder',
                      ),
                      prefixIcon: Icons.search_outlined,
                      onTapSuffixIcon: () => notifier.clearSearch(),
                      suffixIconShow: notifier.searchController.text.isNotEmpty,
                      sufixIcon: Icons.close,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingButton(
                  onPressed: () => notifier.goToCreateAddress(context),
                ),
              ),
            ],
          )
        : notifier.isLogged
            ? FutureBuilder(
                future: notifier.getLoggedUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == false) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              translator.translate(
                                context,
                                screen: 'home_page',
                                key: 'cant_load_your_information',
                              ),
                              style: AppStyles.medium,
                            ),
                            Text(
                              translator.translate(
                                context,
                                screen: 'home_page',
                                key: 'try_again_later',
                              ),
                              style: AppStyles.small,
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            CustomButton(
                              onPressed: () => notifier.logout(context),
                              label: translator.translate(
                                context,
                                screen: 'home_page',
                                key: 'logout',
                              ),
                              isLoading: state.isLoadingSignOut,
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 2,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          translator.translate(
                            context,
                            screen: 'home_page',
                            key: 'loading_your_information',
                          ),
                          style: AppStyles.medium,
                        ),
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ),
              );
  }
}
