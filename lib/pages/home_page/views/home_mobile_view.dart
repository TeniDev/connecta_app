import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../../services/services.dart';

class HomeMobileView extends ConsumerWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Welcome ${ref.watch(authProvider).currentUser!.displayName}',
            style: AppStyles.medium,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your birthday is: ',
            style: AppStyles.medium,
          ),
          const SizedBox(height: 20),
          FutureBuilder(
            future: ref.read(databaseServiceProvider).getDocument(
                  documentId: ref.read(authProvider).currentUser!.uid,
                  collection: AppConstants.userCollection,
                ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  '${(snapshot.data!['birthday'] as Timestamp).toDate().toLocal()}',
                  style: AppStyles.medium,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              await ref.read(authServiceProvider).signOut();
              if (context.mounted) context.pushReplacement(RoutesNames.loginRoute);
            },
            child: const Text(
              'Sign Out',
              style: AppStyles.buttons,
            ),
          ),
        ],
      ),
    );
    /* return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: ref.read(databaseServiceProvider).getDocument(
                    documentId: ref.read(authProvider).currentUser!.uid,
                    collection: AppConstants.userCollection,
                  ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${(snapshot.data!['birthday'] as Timestamp).toDate().toLocal()}',
                    style: AppStyles.medium,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            InkWell(
              onTap: () async {
                await ref.read(authServiceProvider).signOut();
                if (context.mounted) context.pushReplacement(RoutesNames.loginRoute);
              },
              child: const Text(
                'Sign Out',
                style: AppStyles.buttons,
              ),
            ),
          ],
        ),
      ),
    ); */
  }
}
