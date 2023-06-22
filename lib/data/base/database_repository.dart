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
  Future<String> updateDocument({
    String? documentId,
    Map<String, dynamic>? data,
    String? collection,
  });
  Future<String> deleteDocument({
    String? documentId,
    String? collection,
  });
}
