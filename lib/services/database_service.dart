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
  Future<String> deleteDocument({String? documentId, String? collection}) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
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
  Future<String> updateDocument({String? documentId, Map<String, dynamic>? data, String? collection}) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream({required String collection}) {
    return ref.read(databaseProvider).collection(collection).snapshots();
  }
}
