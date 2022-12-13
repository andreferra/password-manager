import 'package:flutter/material.dart';
import 'package:password_manager/backend/firestore.dart';
import 'package:password_manager/util/color.dart';
import 'package:password_manager/widget/input.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({super.key});

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _formKey = GlobalKey<FormState>();

  // text controller
  final _sito = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();
  final _altro = TextEditingController();
  final _link = TextEditingController();
  final _categoria = TextEditingController();

  @override
  void dispose() {
    _sito.dispose();
    _username.dispose();
    _password.dispose();
    _email.dispose();
    _altro.dispose();
    _link.dispose();
    _categoria.dispose();
    super.dispose();
  }

  _handlerAggiungiPassword() async {
    if (_formKey.currentState!.validate()) {
      await FirestoreMethods().addPassword(
          sito: _sito.text,
          username: _username.text,
          password: _password.text,
          email: _email.text,
          altro: _altro.text,
          link: _link.text,
          categoria: _categoria.text);
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Password aggiunta correttamente'),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('AGGIUNGI PASSWORD '),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      const Text(
                        'Completa i dati per aggiungere la password.',
                        textAlign: TextAlign.center,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InputForm(
                                label: "Nome Sito/Applicazione",
                                controller: _sito,
                                icon: Icons.web,
                              ),
                              InputForm(
                                  label: "Username",
                                  controller: _username,
                                  icon: Icons.person),
                              InputForm(
                                  label: "Password",
                                  controller: _password,
                                  icon: Icons.lock),
                              InputForm(
                                  label: "Email",
                                  controller: _email,
                                  icon: Icons.email),
                              InputForm(
                                  label: "Altro",
                                  controller: _altro,
                                  icon: Icons.more_horiz),
                              InputForm(
                                  label: "Link",
                                  controller: _link,
                                  icon: Icons.link),
                              InputForm(
                                  label: "Categoria",
                                  controller: _categoria,
                                  icon: Icons.category),
                            ],
                          ))
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Annulla',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('SALVA',
                        style: TextStyle(
                            color: secondaryColor,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _handlerAggiungiPassword();
                    },
                  ),
                ],
              );
            });
      },
      child: const Icon(
        Icons.add,
        color: lightColor,
      ),
    );
  }
}
