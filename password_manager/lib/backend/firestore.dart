import 'package:firedart/firedart.dart';

class FirestoreMethods {
  Future<void> addPassword(
      {required String sito,
      required String username,
      required String password,
      required String email,
      required String altro,
      required String link,
      required String categoria}) async {
    final collection = Firestore.instance.collection('password');
    await collection.add({
      'sito': sito,
      'username': username,
      'password': password,
      'email': email,
      'altro': altro,
      'link': link,
      'categoria': categoria,
    });
  }
}
