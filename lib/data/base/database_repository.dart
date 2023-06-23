abstract class DatabaseRepository {
  Future<Map<String, dynamic>?> getDocument({
    String? documentId,
    String? collection,
  });
  Future<String> saveDocument({
    String? documentId,
    Map<String, dynamic>? data,
    String? collection,
  });
  Future<bool> updateDocument({
    String? documentId,
    Map<String, dynamic>? data,
    String? collection,
  });
  Future<bool> deleteDocument({
    String? documentId,
    String? collection,
  });
}
