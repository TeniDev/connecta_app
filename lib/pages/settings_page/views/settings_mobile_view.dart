import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/widgets.dart';
import '../../../data/providers/providers.dart';
import '../providers/settings_providers.dart';

class SettingsMobileView extends ConsumerWidget {
  const SettingsMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userSessionProvider);
    final notifier = ref.read(settingsPageProvider.notifier);
    final locale = ref.watch(localeProvider);
    final translator = ref.read(localeProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInLeft(
                from: 30,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => notifier.pop(context),
                  child: const SizedBox(
                    width: 20,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              FadeInDown(
                from: 30,
                child: Center(
                  child: Text(
                    translator.translate(
                      context,
                      screen: 'settings_page',
                      key: 'settings_title',
                    ),
                    style: AppStyles.title,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              FadeInLeft(
                from: 30,
                child: Text(
                  translator.translate(
                    context,
                    screen: 'settings_page',
                    key: 'language_title',
                  ),
                  style: AppStyles.medium,
                ),
              ),
              const Spacer(),
              FadeInRight(
                from: 30,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.greySecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      items: SupportLocale.support
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.languageCode == 'en' ? 'English' : 'Español',
                                style: AppStyles.medium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      value: locale,
                      onChanged: (value) => notifier.changeLanguage(value!),
                      dropdownColor: AppColors.greyThird,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          user != null
              ? FadeInUp(
                  from: 30,
                  child: Center(
                    child: SizedBox(
                      child: CustomButton(
                        onPressed: () => notifier.logout(context),
                        label: translator.translate(
                          context,
                          screen: 'settings_page',
                          key: 'logout',
                        ),
                        isLarge: true,
                        bgColor: AppColors.blue,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
