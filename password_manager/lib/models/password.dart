import 'package:cloud_firestore/cloud_firestore.dart';

class Password {
  final String sito;
  final String email;
  final String password;
  final String username;
  final String altro;
  final String link;
  final String categoria;

  const Password(
      {
      required this.sito,
      required this.email,
      required this.password,
      required this.username,
      required this.altro,
      required this.link,
      required this.categoria});

  Map<String, dynamic> toJson() => {
        'sito': sito,
        'email': email,
        'password': password,
        'username': username,
        'altro': altro,
        'link': link,
        'categoria': categoria,
      };

  static Password fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Password(
      sito: snapshot['sito'],
      email: snapshot['email'],
      password: snapshot['password'],
      username: snapshot['username'],
      altro: snapshot['altro'],
      link: snapshot['link'],
      categoria: snapshot['categoria'],
    );
  }
}
