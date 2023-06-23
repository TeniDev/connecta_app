import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/constants.dart';
import '../core/utils/utils.dart';
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

  Future<String> saveAddress({required AddressModel address}) async {
    try {
      final collection =
          '${AppConstants.userCollection}/${ref.read(authServiceProvider).getCurrentUser()}/${AppConstants.addressCollection}';
      final addressId = ref.read(databaseServiceProvider).createId(collection: collection);
      if (addressId == null) return 'Error creando el id';

      address = address.copyWith(id: addressId);
      final result = await ref.read(databaseServiceProvider).saveDocument(
            documentId: addressId,
            data: address.toJson(),
            collection: collection,
          );
      return result;
    } catch (e) {
      logger.error(e);
      return '$e';
    }
  }

  Future<bool> editAddress({required AddressModel address}) async {
    try {
      final collection =
          '${AppConstants.userCollection}/${ref.read(authServiceProvider).getCurrentUser()}/${AppConstants.addressCollection}';

      final result = await ref.read(databaseServiceProvider).updateDocument(
            documentId: address.id,
            data: address.toJson(),
            collection: collection,
          );
      return result;
    } catch (e) {
      logger.error(e);
      return false;
    }
  }

  Future<bool> deleteAddress({required String addressId}) async {
    try {
      await ref.read(databaseServiceProvider).deleteDocument(
            documentId: addressId,
            collection:
                '${AppConstants.userCollection}/${ref.read(authServiceProvider).getCurrentUser()}/${AppConstants.addressCollection}',
          );
      return true;
    } catch (e) {
      logger.error(e);
      return false;
    }
  }
}
