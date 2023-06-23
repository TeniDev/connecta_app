import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/utils.dart';
import '../data/base/base.dart';
import '../data/providers/providers.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) => DatabaseService(ref));

class DatabaseService implements DatabaseRepository {
  DatabaseService(this.ref);

  final Ref ref;

  @override
  Future<bool> deleteDocument({String? documentId, String? collection}) async {
    try {
      await ref.read(databaseProvider).collection(collection!).doc(documentId).delete();
      return true;
    } on FirebaseException catch (e) {
      logger.error(e);
      return false;
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> getDocument({String? documentId, String? collection}) async {
    try {
      final result = await ref.read(databaseProvider).collection(collection!).doc(documentId).get();
      return result.data() as Map<String, dynamic>;
    } on FirebaseException catch (e) {
      logger.error(e);
      return null;
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  @override
  Future<String> saveDocument({String? documentId, Map<String, dynamic>? data, String? collection}) async {
    try {
      await ref.read(databaseProvider).collection(collection!).doc(documentId).set(data!);
      return '';
    } on FirebaseException catch (e) {
      logger.error(e);
      return e.code;
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  @override
  Future<bool> updateDocument({String? documentId, Map<String, dynamic>? data, String? collection}) async {
    try {
      await ref.read(databaseProvider).collection(collection!).doc(documentId).update(data!);
      return true;
    } on FirebaseException catch (e) {
      logger.error(e);
      return false;
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }

  String? createId({required String? collection}) {
    try {
      final collRef = ref.read(databaseProvider).collection(collection!);
      final docReference = collRef.doc();
      return docReference.id;
    } catch (e) {
      logger.error(e);
      rethrow;
    }
  }
}
