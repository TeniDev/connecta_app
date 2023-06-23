import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/constants.dart';
import '../data/models/models.dart';
import '../data/providers/providers.dart';
import 'services.dart';

final addressService = Provider((ref) => AddressService(ref));

class AddressService {
  final Ref ref;

  AddressService(this.ref);

  Stream<List<AddressModel>> getAllAddress({required String userId}) {
    Stream<QuerySnapshot<Map<String, dynamic>>> streamAddress = ref
        .read(databaseProvider)
        .collection(
            '${AppConstants.userCollection}/${ref.read(authServiceProvider).getCurrentUser()}/${AppConstants.addressCollection}')
        .snapshots();
    return streamAddress.map((qShot) => qShot.docs.map((doc) => AddressModel.fromJson(doc.data())).toList());
  }
}
